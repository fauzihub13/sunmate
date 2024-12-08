import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/widgets/news_card.dart';
import 'package:flutter_sunmate/src/core/components/search_bar.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/models/news.dart';

class NewsListPages extends StatelessWidget {
  const NewsListPages({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return const MobileView();
      } else {
        return const MobileView();
      }
    });
  }
}

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  final TextEditingController searchController = TextEditingController();
  List<News> searchResults = [];
  final List<News> news = newsList;

  @override
  void initState() {
    super.initState();
    searchResults = news; 
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchResults = news
          .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunNews', canBack: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          children: [
            CustomSearchBar(
              controller: searchController,
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(child: Text('Tidak ada hasil ditemukan.'))
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final News newsData = searchResults[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: NewsCard(data: newsData),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
