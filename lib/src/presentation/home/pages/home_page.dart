import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/list_vendor.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/widgets/slider_news.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/appbar.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/banner.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/title_section.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_list_page.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/pages/news_list_pages.dart';

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
                    child: TitleSection(
                        title: 'Berita Terkini',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const NewsListPages();
                          }));
                        }),
                  ),
                  const SliderNews(
                    itemCount: 3,
                  ),
                  const SizedBox(height: 22.0),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: TitleSection(
                        title: 'Vendor Panel Surya',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const VendorListPage();
                          }));
                        }),
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
