import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc/theme_bloc/theme_bloc.dart';
import 'package:news_app/shared/bloc_provider_wrapper.dart';
import 'package:news_app/shared/init/init_app.dart';
import 'package:news_app/utils/routes.dart';

void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviderWrapper(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: Routes.onGenerateRoute);
        },
      ),
    );
  }
}
