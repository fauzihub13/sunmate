import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/components/empty_page.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/bloc/news_list/news_list_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailNews extends StatelessWidget {
  final String newsId;
  const DetailNews({super.key, required this.newsId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileView(
          newsId: newsId,
        );
      } else {
        return MobileView(
          newsId: newsId,
        );
      }
    });
  }
}

class MobileView extends StatefulWidget {
  final String newsId;
  const MobileView({super.key, required this.newsId});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  void initState() {
    super.initState();
    context
        .read<NewsListBloc>()
        .add(NewsListEvent.getDetailNews(newsId: widget.newsId));
  }

  Future<void> _refreshPage() async {
    context
        .read<NewsListBloc>()
        .add(NewsListEvent.getDetailNews(newsId: widget.newsId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Detail Berita', canBack: true),
        body: SafeArea(
          child: RefreshIndicator(
            color: AppColors.primary,
            backgroundColor: AppColors.white,
            onRefresh: _refreshPage,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BlocConsumer<NewsListBloc, NewsListState>(
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
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height -
                          AppBar().preferredSize.height,
                      child: const Center(child: CustomLoadingIndicator()),
                    );
                  }, detailNewsLoaded: (news) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: 250,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '${Variables.baseUrl}/storage/${news.image!}',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              DateFormat('dd MMMM yyyy')
                                  .format(news.createdAt!),
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              news.title!,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkBlue),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ReadMoreText(
                              news.description!,
                              textAlign: TextAlign.justify,
                              trimLines: 8,
                              colorClickableText: AppColors.darkBlue,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '..Selengkapnya',
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                              trimExpandedText: ' Persingkat',
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    );
                  }, error: (message) {
                    return EmptyPage(
                      message: message,
                    );
                  });
                },
              ),
            ),
          ),
        ));
  }
}
