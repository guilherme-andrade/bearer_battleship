module.exports = {
  test: /\.(ts|js|tsx|jsx)$/,
  use: [
    {
      loader: "babel-loader",
      options: {
        presets: ["@babel/preset-typescript"],
      },
    },
  ],
};
