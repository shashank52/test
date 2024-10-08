import 'package:myapp/shared/data/models/news_model.dart';

abstract class NewsRepo{
  Future<NewsModel> getNews();
}
