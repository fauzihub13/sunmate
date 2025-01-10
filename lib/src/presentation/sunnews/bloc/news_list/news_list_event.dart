part of 'news_list_bloc.dart';

@freezed
class NewsListEvent with _$NewsListEvent {
  const factory NewsListEvent.started() = _Started;
  const factory NewsListEvent.getNews() = _GetNews;
  const factory NewsListEvent.getDetailNews({required String newsId}) = _GetDetailNews;
}