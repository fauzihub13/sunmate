import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/news.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/pages/detail_news.dart';

class NewsCard extends StatelessWidget {
  final News data;
  const NewsCard({Key? key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailNews(news: data);
        }));
      },
      child: SizedBox(
        height: 100,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  data.imageAsset,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0),
                          Color.fromRGBO(0, 0, 96, 0.498),
                        ],
                        stops: [
                          0.2,
                          0.7,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    data.title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
