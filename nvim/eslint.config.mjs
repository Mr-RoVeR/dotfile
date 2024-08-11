//npm init @eslint/config to setup eslint
import globals from "globals";

export default [
  { languageOptions: { globals: { ...globals.browser, ...globals.node } } },
];

