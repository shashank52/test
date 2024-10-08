import 'package:myapp/shared/init/init_dependencies.dart';
import 'package:myapp/shared/data/repositories/news_repo/news_repo.dart';
import 'package:myapp/shared/data/repositories/news_repo/news_repo_impl.dart';

void initRepos() {
  getIt.registerSingleton<NewsRepo>(NewsRepoImpl());
}

NewsRepo get newsRepo => getIt.get();
