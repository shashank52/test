import 'package:news_app/shared/data/models/news_model.dart';
import 'package:news_app/shared/data/models/news_saved_model.dart';
import 'package:news_app/shared/data/repositories/news_repo/news_repo.dart';
import 'package:news_app/shared/repos.dart';

class NewsRepoImpl extends NewsRepo {
  @override
  Future<NewsModel?> getNews({bool isLocal = false}) async {
    if (isLocal) {
      final localResult = newsRepoLocalDs.fetch();
      if (localResult != null) {
        return NewsModel.fromJson( localResult.newsModel);
      }
      return null;
    }
    try {
      final result = await newsRepoRemoteDs.getNews();
      newsRepoLocalDs.store(NewsSavedModel(result.toJson()));
      return result;
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
