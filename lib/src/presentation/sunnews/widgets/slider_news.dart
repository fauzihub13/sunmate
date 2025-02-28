import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/bloc/news_list/news_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/models/news.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/widgets/news_card.dart';

class SliderNews extends StatefulWidget {
  final int? itemCount;

  const SliderNews({super.key, this.itemCount});

  @override
  State<SliderNews> createState() => _SliderNewsState();
}

class _SliderNewsState extends State<SliderNews> {
  @override
  void initState() {
    // context.read<NewsListBloc>().add(const NewsListEvent.getNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final int count = widget.itemCount ?? newsList.length;

    return BlocBuilder<NewsListBloc, NewsListState>(
      builder: (context, state) {
        return state.maybeWhen(orElse: () {
          return Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin: const EdgeInsets.only(top: 5.0),
              child: const Center(child: Text('Fetching data.')));
        }, loading: () {
          return Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin: const EdgeInsets.only(top: 5.0),
              child: const Center(
                child: CustomLoadingIndicator(),
              ));
        }, loaded: (news) {
          return Scrollbar(
            controller: scrollController,
            child: Container(
                height: 150,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                margin: const EdgeInsets.only(top: 5.0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: news.length > count ? count : news.length,
                    itemBuilder: (context, index) {
                      final singleNews = news[index];
                      return NewsCard(data: singleNews);
                    })),
          );
        }, error: (error) {
          return Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin: const EdgeInsets.only(top: 5.0),
              child: const Center(child: Text('Please try again.')));
        });
      },
    );
  }
}
