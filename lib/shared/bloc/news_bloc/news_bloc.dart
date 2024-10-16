import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/data/models/news_model.dart';
import 'package:news_app/shared/repos.dart';
import 'package:news_app/utils/exceptions/exceptions.dart';

part 'news_events.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsFetch>((event, emit) async {
      if (!event.isAutoRefresh) {
        emit(NewsLoading());
      }
      late final NewsModel? localResult;
      try {
        // fetch data from db
        localResult = await newsRepo.getNews(isLocal: true);

        if (localResult != null) {
          if (localResult.articles.isNotEmpty) {
            emit(NewsLoaded(newsModel: localResult));
          }
        }
        // hit api to get latest data
        final result = await newsRepo.getNews();
        if (result != null && result.articles.isNotEmpty) {
          emit(NewsLoaded(newsModel: result, message: localResult!=null ? 'Data Updated': ''));
        } 
      } on EmptyException catch (e) {
        if (localResult != null && localResult.articles.isNotEmpty) {
          emit((state as NewsLoaded).copyWith(message: e.message));
        } else {
          emit(NewsError(message: e.message));
        }
      } on RepoException catch (e) {
        if (localResult != null && localResult.articles.isNotEmpty) {
          emit((state as NewsLoaded).copyWith(message: e.message));
        } else {
          emit(NewsError(message: e.message));
        }
      } catch (e) {
        if (localResult != null && localResult.articles.isNotEmpty) {
          emit((state as NewsLoaded).copyWith(message: e.toString()));
        } else {
          emit(NewsError(message: e.toString()));
        }
      }
    });
  }
}
