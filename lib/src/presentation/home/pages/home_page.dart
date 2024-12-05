import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/list_vendor.dart';
import 'package:flutter_sunmate/src/core/components/slider_news.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/appbar.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/banner.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/title_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const MainAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeBanner(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child:
                        TitleSection(title: 'Berita Terkini', onPressed: () {}),
                  ),
                  const SliderNews(
                    itemCount: 3,
                  ),
                  const SizedBox(height: 22.0),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: TitleSection(
                        title: 'Vendor Panel Surya', onPressed: () {}),
                  ),
                  const ListVendor(
                    itemCount: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
