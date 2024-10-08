import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/shared/repos.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2715045341.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1375219149.
final getIt = GetIt.instance;
Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  initRepos();
}
