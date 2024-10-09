import 'package:hive/hive.dart';

part 'news_saved_model.g.dart';

@HiveType(typeId: 1)
class NewsSavedModel extends HiveObject {
  @HiveField(0)
  String newsModel;
  NewsSavedModel(this.newsModel);
}
