import application from "plugins/stimulus";

const context = require.context("./", true, /index.(ts|js)$/);
const stylesContext = require.context("./", true, /styles.module.scss$/);

context.keys().forEach((path) => {
  const mod = context(path);
  if (!mod.default) return;

  const identifier = path
    .replace(/^\.\//, "")
    .replace(/components\//, "")
    .replace(/\/index\.(ts|js)$/, "")
    .replace(/\//g, "--")
    .replace(/\_/g, "-");

  application.register(identifier, mod.default);
});

context.keys().forEach(context);
stylesContext.keys().forEach(stylesContext);
