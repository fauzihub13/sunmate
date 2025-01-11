import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/components/empty_page.dart';
import 'package:flutter_sunmate/src/core/components/search_bar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/news/news_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/bloc/news_list/news_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/widgets/news_card.dart';

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
  List<SingleNews> searchResults = [];
  final GlobalKey searchBarKey = GlobalKey();
  double searchBarHeight = 0.0;

  @override
  void initState() {
    super.initState();
    context.read<NewsListBloc>().add(const NewsListEvent.getNews());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          searchBarKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          searchBarHeight = renderBox.size.height;
        });
        // print(searchBarHeight);
      }
    });
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchResults = searchResults
          .where((e) => e.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Future<void> _refreshPage() async {
    context.read<NewsListBloc>().add(const NewsListEvent.getNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'SunNews', canBack: true),
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.white,
        onRefresh: _refreshPage,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: [
              CustomSearchBar(
                key: searchBarKey,
                controller: searchController,
                onChanged: _onSearchChanged,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                  child: BlocListener<NewsListBloc, NewsListState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      error: (message) {
                        if (message == 'logged_out') {
                          AuthLocalDatasources().removeAuthData();

                          // Schedule SnackBar display after current frame
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            CustomSnackbar.show(context,
                                message: 'Silahkan login kembali.',
                                status: 'fail');

                            // Navigate to LoginPage after the SnackBar
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                              (route) => false,
                            );
                          });
                        }
                      });
                },
                child: BlocBuilder<NewsListBloc, NewsListState>(
                    builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return EmptyPage(
                      message: 'Fetching news data.',
                      searchBarHeight: searchBarHeight,
                    );
                  }, loading: () {
                    return const Center(
                      child: CustomLoadingIndicator(),
                    );
                  }, loaded: (news) {
                    searchResults = news;
                    final filteredNews = searchController.text.isEmpty
                        ? searchResults
                        : searchResults
                            .where((news) => news.title!
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase()))
                            .toList();
                    return filteredNews.isEmpty
                        ? const Center(
                            child: Text('No news found.'),
                          )
                        : ListView.builder(
                            itemCount: filteredNews.length,
                            itemBuilder: (context, index) {
                              final news = filteredNews[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: NewsCard(data: news),
                              );
                            });
                  });
                }),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
