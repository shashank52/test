import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/data/models/news_model.dart';
import 'package:news_app/shared/repos.dart';

part 'news_events.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsFetch>((event, emit) async {
      if (!event.isAutoRefresh) {
        emit(NewsLoading());
      }
      try {
        final result = await newsRepo.getNews();
        if (result.articles.isNotEmpty) {
          emit(NewsLoaded(newsModel: result));
        } else {
          emit(const NewsError(message: "No news found"));
        }
      } catch (e) {
        emit(NewsError(message: e.toString()));
      }
    });
  }
}
