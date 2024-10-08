import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/shared/bloc/news_bloc/news_bloc.dart';
import 'package:myapp/shared/bloc/theme_bloc/theme_bloc.dart';

class BlocProviderWrapper extends StatelessWidget {
  const BlocProviderWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => NewsBloc()),
        BlocProvider(create: (context)=> ThemeBloc())],
        child: child);
  }
}
