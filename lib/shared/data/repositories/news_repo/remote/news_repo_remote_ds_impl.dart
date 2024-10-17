import 'package:dio/dio.dart';
import 'package:news_app/shared/app_endpoints.dart';
import 'package:news_app/shared/constants/api_keys.dart';
import 'package:news_app/shared/data/models/news_model.dart';
import 'package:news_app/shared/data/repositories/news_repo/remote/news_repo_remote_ds.dart';
import 'package:news_app/utils/exceptions/exceptions.dart';

class NewsRepoRemoteDsImpl extends NewsRepoRemoteDs {
  @override
  Future<NewsModel> getNews() async {
    try {
      final result = await Dio().get(AppEndpoints.newsApi, queryParameters: {
        ApiKeys.apiKey: AppEndpoints.apiKey,
        ApiKeys.country: 'us'
      });

      return NewsModel.fromMap(result.data);
    } on DioException catch (dioError) {
      // Handle Dio-specific errors
      if (dioError.type == DioExceptionType.connectionTimeout) {
        throw RepoException('Connection Timeout');
      } else if (dioError.type == DioExceptionType.receiveTimeout) {
        throw RepoException('Receive Timeout');
      } else if (dioError.type == DioExceptionType.badResponse) {
        throw RepoException(
            'Unable to process request: ${dioError.response?.data['message']} ');
      } else if (dioError.response != null) {
        throw RepoException(
            'Received invalid status code: ${dioError.response?.statusCode}');
      } else {
        throw RepoException('Unexpected error: ${dioError.message}');
      }
    } catch (err) {
      throw RepoException('Something went wrong: ${err.toString()}');
    }
  }
}
