import 'package:bloc/bloc.dart';
import 'package:flutter_sunmate/src/data/models/response/news/news_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/news/news_remote_datasources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_list_bloc.freezed.dart';
part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final NewsRemoteDatasources newsRemoteDatasources;
  NewsListBloc(this.newsRemoteDatasources) : super(const _Initial()) {
    on<_GetNews>((event, emit) async {
      emit(const _Loading());

      final result = await newsRemoteDatasources.getNews();

      result.fold((error) => emit(_Error(error)), (value) {
        emit(_Loaded(value.newsList ?? []));
      });
    });

    on<_GetDetailNews>((event, emit) async {
      emit(const _Loading());

      final result = await newsRemoteDatasources.getDetailNews(event.newsId);

      result.fold((error) => emit(_Error(error)), (value) {
        emit(_DetailNewsLoaded(value.singleNews!));
      });
    });
  }
}
