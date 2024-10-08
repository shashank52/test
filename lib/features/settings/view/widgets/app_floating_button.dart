import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/settings/data/model/mock_data.dart';
import 'package:news_app/shared/bloc/theme_bloc/theme_bloc.dart';

/// The `AppFloatingButton` class is a Flutter widget that displays a floating action button and toggles
/// the theme between light and dark mode when pressed.
class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<ThemeBloc>(context).add(ThemeEvent(
            switchBrightness: true, appColor: appColorModel.data[0]));
      },
      tooltip: 'Switch theme',
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        if (state.isLightTheme) {
          return const Icon(Icons.light_mode);
        } else {
          return const Icon(Icons.dark_mode);
        }
      }),
    );
  }
}
