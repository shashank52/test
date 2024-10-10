import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/features/home/view/widgets/news_widget.dart';
import 'package:news_app/features/settings/view/widgets/app_floating_button.dart';
import 'package:news_app/shared/bloc/news_bloc/news_bloc.dart';
import 'package:news_app/shared/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('News Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(Routes.setting),
                child: const Icon(Icons.settings)),
          )
        ],
      ),
      body: EasyRefresh(
        onRefresh: () =>
            context.read<NewsBloc>()..add(const NewsFetch(isAutoRefresh: true)),
        child: BlocProvider<NewsBloc>.value(
          value: context.read<NewsBloc>()..add(const NewsFetch()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading || state is NewsInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsLoaded) {
                return ListView.builder(
                    itemCount: state.newsModel.articles.length,
                    itemBuilder: (context, index) => NewsWidget(
                          article: state.newsModel.articles[index],
                          index: index,
                        ));
              } else if (state is NewsError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.gpp_bad, size: 48),
                      const Gap(8),
                      Text(state.message),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      floatingActionButton: const AppFloatingButton(),
    );
  }
}
