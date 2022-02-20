declare namespace StylesModuleScssNamespace {
  export interface IStylesModuleScss {
    cell: string;
    "cell--main-player": string;
    "cell--miss": string;
    "cell--opponent": string;
    expand: string;
    explode: string;
    hitbox: string;
  }
}

declare const StylesModuleScssModule: StylesModuleScssNamespace.IStylesModuleScss & {
  /** WARNING: Only available when `css-loader` is used without `style-loader` or `mini-css-extract-plugin` */
  locals: StylesModuleScssNamespace.IStylesModuleScss;
};

export = StylesModuleScssModule;
