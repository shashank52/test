import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:myapp/shared/bloc/news_bloc/news_bloc.dart';
import 'package:myapp/utils/extensions/date_time.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsArgs {
  final int index;
  const NewsDetailsArgs({required this.index});
}

class NewsDetails extends StatelessWidget {
  const NewsDetails({super.key, required this.args});
  final NewsDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Hero(
      tag: args.index,
      child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        if (state is NewsLoaded) {
          final article = state.newsModel.articles[args.index];
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text('News Detail')),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: article.urlToImage,
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                  const Gap(12),
                  Text(
                    article.title,
                    style: theme.titleLarge,
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Text(
                        article.source.name,
                        style: theme.titleMedium,
                      ),
                      const Gap(8),
                      const Text("|"),
                      const Gap(8),
                      Text(
                        article.publishedAt.readAbleFormat(),
                        style: theme.titleSmall,
                      )
                    ],
                  ),
                  const Divider(),
                  const Gap(8),
                  article.content.isNotEmpty
                      ? SingleChildScrollView(child: Text(article.content))
                      : const Text("Content Not Available")
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton.icon(
                onPressed: () => launch(article.url),
                icon: const Icon(Icons.share_outlined),
                label: const Text('Link to Full article'),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }

  Future<void> launch(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
