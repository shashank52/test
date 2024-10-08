import 'package:dio/dio.dart';
import 'package:myapp/shared/data/models/news_model.dart';
import 'package:myapp/shared/data/repositories/news_repo/news_repo.dart';
import 'package:myapp/utils/app_endpoints.dart';

class NewsRepoImpl extends NewsRepo {
  @override
  Future<NewsModel> getNews() async {
    try {
      final result = await Dio().get(AppEndpoints.newsApi,
          queryParameters: {"apiKey": AppEndpoints.apiKey});
      if (result.statusCode == 200) {
        return NewsModel.fromMap(result.data);
      } else {
        return NewsModel(articles: [], status: "", totalResults: 0);
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
