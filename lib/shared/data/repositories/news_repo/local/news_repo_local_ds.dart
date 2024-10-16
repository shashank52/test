import 'package:news_app/shared/data/models/news_saved_model.dart';

abstract class NewsRepoLocalDs {
  NewsSavedModel? fetch();
  Future<void> store(NewsSavedModel data);
  Future<void> clearAllData();
}
