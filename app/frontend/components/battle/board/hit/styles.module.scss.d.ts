declare namespace StylesModuleScssNamespace {
  export interface IStylesModuleScss {
    explode: string;
    hit: string;
    "hit--hit": string;
    "hit--main-player": string;
    "hit--miss": string;
    "hit--opponent": string;
  }
}

declare const StylesModuleScssModule: StylesModuleScssNamespace.IStylesModuleScss & {
  /** WARNING: Only available when `css-loader` is used without `style-loader` or `mini-css-extract-plugin` */
  locals: StylesModuleScssNamespace.IStylesModuleScss;
};

export = StylesModuleScssModule;
