import 'package:news_app/shared/data/models/news_model.dart';

abstract class NewsRepoRemoteDs {
  Future<NewsModel> getNews();
}
