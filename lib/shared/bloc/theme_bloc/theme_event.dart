part of 'theme_bloc.dart';

/// The `ThemeEvent` class represents an event related to changing the theme in a Dart application,
/// including the app color and an optional switch for brightness.
class ThemeEvent extends Equatable {
 const ThemeEvent(
      {required this.appColor , this.switchBrightness = false});
  final AppColor appColor;
  final bool switchBrightness;

  @override
  List<Object> get props => [appColor, switchBrightness];
}