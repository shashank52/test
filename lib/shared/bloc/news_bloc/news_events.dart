part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class NewsFetch extends NewsEvent {
  final bool isAutoRefresh;

  const NewsFetch({this.isAutoRefresh = false});

  @override
  List<Object> get props => [isAutoRefresh];
}
