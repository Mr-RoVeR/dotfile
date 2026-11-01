#!/bin/sh
#   ./setup-battery-profile.sh              # defaults: start=90 stop=95
#   ./setup-battery-profile.sh 0 100        # no charge limit (max runtime per charge)
#   ./setup-battery-profile.sh 75 80        # gentler on the cells (less runtime)
set -u

PROFILE_NAME="battery-max"
START="${1:-90}"
STOP="${2:-95}"
BAT_NAME="BAT0"

say()  { printf '[*] %s\n' "$*"; }
warn() { printf '[!] %s\n' "$*" >&2; }
die()  { printf '[x] %s\n' "$*" >&2; exit 1; }

[ "$(id -u)" -eq 0 ] || die "Run this script as root."

case "$START$STOP" in
    *[!0-9]*) die "START and STOP must be whole numbers." ;;
esac
[ "$START" -lt "$STOP" ] || die "START ($START) must be lower than STOP ($STOP)."
[ "$STOP" -le 100 ]      || die "STOP cannot be above 100."

command -v tuned-adm >/dev/null 2>&1 || die "tuned is not installed. Run: emerge --ask sys-power/tuned"
command -v rc-service >/dev/null 2>&1 || die "rc-service not found. This script is for OpenRC."

say "Enabling dbus and tuned in OpenRC..."
rc-update add dbus default  >/dev/null 2>&1
rc-update add tuned default >/dev/null 2>&1

rc-service dbus status  >/dev/null 2>&1 || rc-service dbus start  || warn "Could not start dbus."
rc-service tuned status >/dev/null 2>&1 || rc-service tuned start || die "Could not start tuned. Check /var/log/tuned/tuned.log"

for i in 1 2 3 4 5 6 7 8 9 10; do
    tuned-adm active >/dev/null 2>&1 && break
    sleep 1
done

if tuned-adm list 2>/dev/null | grep -q 'laptop-battery-powersave'; then
    BASE="laptop-battery-powersave"
elif tuned-adm list 2>/dev/null | grep -q 'powersave'; then
    BASE="powersave"
else
    die "No suitable base profile found (laptop-battery-powersave / powersave)."
fi
say "Base profile: $BASE"

if [ -d /usr/lib/tuned/profiles ]; then
    PROFILE_ROOT="/etc/tuned/profiles"
else
    PROFILE_ROOT="/etc/tuned"
fi
PROFILE_DIR="$PROFILE_ROOT/$PROFILE_NAME"
mkdir -p "$PROFILE_DIR" || die "Could not create $PROFILE_DIR"
say "Profile directory: $PROFILE_DIR"

cat > "$PROFILE_DIR/battery-limit.sh" << 'EOF'
#!/bin/sh

BAT="/sys/class/power_supply/__BAT__"
START=__START__
STOP=__STOP__

case "$1" in
    start)
        for i in $(seq 1 10); do
            [ -e "$BAT/charge_control_start_threshold" ] &&
            [ -e "$BAT/charge_control_end_threshold" ] && break
            sleep 1
        done

        if [ ! -e "$BAT/charge_control_start_threshold" ] ||
           [ ! -e "$BAT/charge_control_end_threshold" ]; then
            echo "Battery threshold interface unavailable." >&2
            exit 0
        fi

        # Kernel needs start < stop. Try stop first (works when raising);
        # if rejected, write start first (works when lowering).
        if echo "$STOP" > "$BAT/charge_control_end_threshold" 2>/dev/null; then
            echo "$START" > "$BAT/charge_control_start_threshold"
        else
            echo "$START" > "$BAT/charge_control_start_threshold"
            echo "$STOP" > "$BAT/charge_control_end_threshold"
        fi

        echo "Battery thresholds: start=$(cat "$BAT/charge_control_start_threshold") stop=$(cat "$BAT/charge_control_end_threshold")"
        ;;

    stop)
        echo "Leaving battery thresholds unchanged."
        ;;

    *)
        echo "Usage: $0 {start|stop}" >&2
        exit 1
        ;;
esac
EOF

sed -i \
    -e "s/__BAT__/$BAT_NAME/" \
    -e "s/__START__/$START/" \
    -e "s/__STOP__/$STOP/" \
    "$PROFILE_DIR/battery-limit.sh"
chmod +x "$PROFILE_DIR/battery-limit.sh"

cat > "$PROFILE_DIR/tuned.conf" << EOF
[main]
summary=Maximum battery saving with charge thresholds
include=$BASE

[script]
script=\${i:PROFILE_DIR}/battery-limit.sh
EOF

say "Applying profile '$PROFILE_NAME'..."
tuned-adm profile "$PROFILE_NAME" || die "tuned-adm failed to apply the profile. Check /var/log/tuned/tuned.log"

echo
say "Active profile:"
tuned-adm active

BAT="/sys/class/power_supply/$BAT_NAME"
if [ -e "$BAT/charge_control_end_threshold" ]; then
    say "Charge thresholds: start=$(cat "$BAT/charge_control_start_threshold" 2>/dev/null) stop=$(cat "$BAT/charge_control_end_threshold")"
else
    warn "No charge threshold interface at $BAT (profile still applied)."
fi

echo
say "Done. Tuned starts on boot, so the profile persists across reboots."
