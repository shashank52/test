import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/shared/constants/hive_storage_keys.dart';
import 'package:news_app/shared/data/models/news_saved_model.dart';
import 'package:news_app/shared/repos.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2715045341.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1375219149.
final getIt = GetIt.instance;
Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  initRepos();
  await Hive.initFlutter();
  Hive.registerAdapter<NewsSavedModel>(NewsSavedModelAdapter());
  await Hive.openBox<NewsSavedModel>(HiveStorageKeys.newsBox);
}
