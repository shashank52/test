import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/shared/constants/hive_storage_keys.dart';
import 'package:news_app/shared/data/models/news_saved_model.dart';
import 'package:news_app/shared/data/repositories/news_repo/local/news_repo_local_ds.dart';

class NewsRepoLocalDsImpl extends NewsRepoLocalDs {
  @override
  NewsSavedModel? fetch() {
    try {
      final newsBox = Hive.box<NewsSavedModel>(HiveStorageKeys.newsBox);
      return newsBox.get(HiveStorageKeys.trendingNews);
    } catch (e) {
      debugPrint("Something went wrong while fetching data");
      return null;
    }
  }

  @override
  Future<void> store(NewsSavedModel data) async {
    try {
      final newsBox = Hive.box<NewsSavedModel>(HiveStorageKeys.newsBox);
      await newsBox.put(HiveStorageKeys.trendingNews, data);
    } catch (e) {
      debugPrint("Something went wrong while stroing data");
    }
  }
}
