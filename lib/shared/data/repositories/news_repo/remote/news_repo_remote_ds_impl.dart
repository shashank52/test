import 'package:dio/dio.dart';
import 'package:news_app/shared/app_endpoints.dart';
import 'package:news_app/shared/data/models/news_model.dart';
import 'package:news_app/shared/data/repositories/news_repo/remote/news_repo_remote_ds.dart';
import 'package:news_app/utils/exceptions/exceptions.dart';

class NewsRepoRemoteDsImpl extends NewsRepoRemoteDs {
  @override
  Future<NewsModel> getNews() async {
    try {
      final result = await Dio().get(AppEndpoints.newsApi,
          queryParameters: {"apiKey": AppEndpoints.apiKey});
      if (result.statusCode == 200) {
        return NewsModel.fromMap(result.data);
      } else {
        throw EmptyException('No Data Found');
      }
    } on EmptyException {
      rethrow;
    } catch (e) {
      throw RepoException('Something Went wrong');
    }
  }
}
