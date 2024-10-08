import 'package:news_app/shared/data/models/news_model.dart';

abstract class NewsRepo {
  Future<NewsModel?> getNews({bool isLocal=false});
}
