import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/vendor/vendor-1.jpg',
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
                  "vendor name vendor name vendor name ",
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
