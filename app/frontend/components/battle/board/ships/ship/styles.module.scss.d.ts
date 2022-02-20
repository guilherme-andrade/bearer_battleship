declare namespace StylesModuleScssNamespace {
  export interface IStylesModuleScss {
    part: string;
    ship: string;
    "ship--ghost": string;
    "ship--placed": string;
  }
}

declare const StylesModuleScssModule: StylesModuleScssNamespace.IStylesModuleScss & {
  /** WARNING: Only available when `css-loader` is used without `style-loader` or `mini-css-extract-plugin` */
  locals: StylesModuleScssNamespace.IStylesModuleScss;
};

export = StylesModuleScssModule;
