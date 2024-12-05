import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/news_card.dart';

class SliderNews extends StatelessWidget {
  const SliderNews({super.key});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return Scrollbar(
      controller: _scrollController,
      child: Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.only(top: 5.0),
        child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            children: [
              NewsCard(),
              NewsCard(),
              NewsCard(),
            ]),
      ),
    );
  }
}
