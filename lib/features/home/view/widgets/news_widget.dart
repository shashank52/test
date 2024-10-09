import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/features/news_details/view/news_details.dart';
import 'package:news_app/shared/data/models/news_model.dart';
import 'package:news_app/utils/extensions/date_time.dart';
import 'package:news_app/shared/routes.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.article, required this.index});

  final Article article;
  final int index;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3980430739.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(Routes.newsDetails,
            arguments: NewsDetailsArgs(index: index)),
        child: Hero(
          tag: index,
          child: Card(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 180,
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
                  placeholder: (context, url) => const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  imageUrl: article.urlToImage,
                  errorWidget: (context, url, error) => const Center(
                    child: SizedBox(height: 180, child: Icon(Icons.error)),
                  ),
                ),
                const Gap(8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: theme.titleMedium,
                      ),
                      const Gap(
                        8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              article.source.name,
                              style: theme.titleSmall,
                            ),
                          ),
                          const Gap(8),
                          Expanded(
                              flex: 1,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      article.publishedAt.readAbleFormat())))
                        ],
                      ),
                      const Gap(8),
                      Text(article.description),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
