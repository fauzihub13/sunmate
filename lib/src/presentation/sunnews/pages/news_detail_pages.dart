import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/news/news_response_model.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class DetailNews extends StatelessWidget {
  final SingleNews news;
  const DetailNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileView(
          news: news,
        );
      } else {
        return MobileView(
          news: news,
        );
      }
    });
  }
}

class MobileView extends StatelessWidget {
  final SingleNews news;
  const MobileView({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Detail Berita', canBack: true),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  DateFormat('dd MMMM yyyy').format(news.createdAt!),
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
        ),
      )),
    );
  }
}
