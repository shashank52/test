import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/settings/data/model/mock_data.dart';
import 'package:news_app/features/settings/view/widgets/app_floating_button.dart';
import 'package:news_app/shared/bloc/theme_bloc/theme_bloc.dart';

import '../data/model/app_color_model.dart';

/// The `SettingsView` class is a Dart class that represents a settings view with a grid of color
/// options that can be selected or rejected.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
                child: Text(
              'Select Color',
              style: Theme.of(context).textTheme.bodyLarge,
            )),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
                    childAspectRatio: width > height
                        ? (width / height) * 2
                        : (height / width) * 2),
                itemCount: appColorModel.data.length,
                itemBuilder: ((context, index) {
                  return BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return Theme(
                        data: ThemeData(
                            brightness: state.isLightTheme
                                ? Brightness.light
                                : Brightness.dark,
                            colorSchemeSeed: appColorModel
                                .data[index].colorCode.materialColor),
                        child: state.appColor == appColorModel.data[index]
                            ? _selectedButton(
                                context, appColorModel.data[index])
                            : _rejectedButton(
                                context, appColorModel.data[index]),
                      );
                    },
                  );
                })),
          )
        ]),
      ),
      floatingActionButton: const AppFloatingButton(),
    );
  }

  Widget _selectedButton(BuildContext context, AppColor appColor) {
    return FilledButton(
        style: const ButtonStyle(),
        onPressed: () => BlocProvider.of<ThemeBloc>(context)
            .add(ThemeEvent(appColor: appColor)),
        child: Text(appColor.colorName));
  }

  Widget _rejectedButton(BuildContext context, AppColor appColor) {
    return FilledButton.tonalIcon(
        icon: Icon(
          Icons.circle,
          size: 16,
          fill: 1,
          color: appColor.colorCode.materialColor,
        ),
        style: const ButtonStyle(),
        onPressed: () => BlocProvider.of<ThemeBloc>(context)
            .add(ThemeEvent(appColor: appColor)),
        label: Text(appColor.colorName));
  }
}
