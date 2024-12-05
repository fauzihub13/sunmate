import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/news_card.dart';
import 'package:flutter_sunmate/src/data/models/news.dart';

class SliderNews extends StatelessWidget {
  final int? itemCount;

  const SliderNews({super.key, this.itemCount});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    final int count = itemCount ?? newsList.length;

    return Scrollbar(
      controller: _scrollController,
      child: Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          margin: const EdgeInsets.only(top: 5.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              itemBuilder: (context, index) {
                final News news = newsList[index];
                return NewsCard(data: news);
              })),
    );
  }
}
