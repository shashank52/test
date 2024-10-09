import 'package:news_app/shared/data/repositories/news_repo/local/news_repo_local_ds.dart';
import 'package:news_app/shared/data/repositories/news_repo/local/news_repo_local_ds_impl.dart';
import 'package:news_app/shared/data/repositories/news_repo/news_repo.dart';
import 'package:news_app/shared/data/repositories/news_repo/news_repo_impl.dart';
import 'package:news_app/shared/data/repositories/news_repo/remote/news_repo_remote_ds.dart';
import 'package:news_app/shared/data/repositories/news_repo/remote/news_repo_remote_ds_impl.dart';
import 'package:news_app/shared/init/init_dependencies.dart';

void initRepos() {
  getIt.registerSingleton<NewsRepo>(NewsRepoImpl());
  getIt.registerSingleton<NewsRepoRemoteDs>(NewsRepoRemoteDsImpl());
  getIt.registerSingleton<NewsRepoLocalDs>(NewsRepoLocalDsImpl());
}

NewsRepo get newsRepo => getIt.get();

NewsRepoRemoteDs get newsRepoRemoteDs => getIt.get();

NewsRepoLocalDs get newsRepoLocalDs => getIt.get();
