part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1725934272.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:203720744.
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsModel newsModel;
  final String message;

  const NewsLoaded({required this.newsModel, this.message = ''});

  NewsLoaded copyWith({NewsModel? newsModel, String? message}) {
    return NewsLoaded(
        newsModel: newsModel ?? this.newsModel,
        message: message ?? this.message);
  }

  @override
  List<Object> get props => [newsModel, message];
}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  final String message;
  const NewsError({required this.message});

  @override
  List<Object> get props => [message];
}
