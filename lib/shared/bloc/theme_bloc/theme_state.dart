part of 'theme_bloc.dart';

/// The `ThemeState` class represents the state of the theme in a Dart application, including the theme
/// data and the app color.
class ThemeState extends Equatable {
  final ThemeData themeData;
  final AppColor appColor;
  const ThemeState(this.themeData, {required this.appColor});

  bool get isLightTheme => themeData.brightness == Brightness.light;
  static ThemeState darkTheme(AppColor appColor) => ThemeState(
      FlexThemeData.dark(
        // scheme: scheme,
        colorScheme: ColorScheme.fromSeed(
            seedColor: appColor.colorCode.materialColor,
            brightness: Brightness.dark),
        // Use very subtly themed app bar elevation in light mode.
        appBarElevation: 0.5,
        useMaterial3: true,
        // We use the nicer Material-3 Typography in both M2 and M3 mode.
        typography: Typography.material2021(
            platform: defaultTargetPlatform,
            colorScheme: const ColorScheme.dark()),
      ),
      appColor: appColor);

  static ThemeState lightTheme(AppColor appColor) => ThemeState(
      FlexThemeData.light(
          // scheme: scheme,
          // Use very subtly themed app bar elevation in light mode.
          colorScheme: ColorScheme.fromSeed(
              seedColor: appColor.colorCode.materialColor,
              brightness: Brightness.light),
          appBarElevation: 2,
          useMaterial3: true,
          // We use the nicer Material-3 Typography in both M2 and M3 mode.
          typography: Typography.material2021(
            platform: defaultTargetPlatform,
          )),
      appColor: appColor);

  @override
  List<Object> get props => [themeData, appColor];
}