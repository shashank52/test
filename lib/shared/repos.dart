import 'package:news_app/shared/data/repositories/news_repo/news_repo.dart';
import 'package:news_app/shared/data/repositories/news_repo/news_repo_impl.dart';
import 'package:news_app/shared/init/init_dependencies.dart';

void initRepos() {
  getIt.registerSingleton<NewsRepo>(NewsRepoImpl());
}

NewsRepo get newsRepo => getIt.get();
