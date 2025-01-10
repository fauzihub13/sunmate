part of 'news_list_bloc.dart';

@freezed
class NewsListState with _$NewsListState {
  const factory NewsListState.initial() = _Initial;
  const factory NewsListState.loading() = _Loading;
  const factory NewsListState.loaded(List<SingleNews> news) = _Loaded;
  const factory NewsListState.detailNewsLoaded(SingleNews news) = _DetailNewsLoaded;
  const factory NewsListState.error(String message) = _Error;
}
