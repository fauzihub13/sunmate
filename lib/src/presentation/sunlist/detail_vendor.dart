import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';

class DetailVendor extends StatelessWidget {
  final Vendor vendor;
  const DetailVendor({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileView(
          vendor: vendor,
        );
      } else {
        return MobileView(
          vendor: vendor,
        );
      }
    });
  }
}

class MobileView extends StatelessWidget {
  final Vendor vendor;
  const MobileView({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return Scaffold(
      appBar: CustomAppbar(title: 'Detail Vendor', canBack: true),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: Container(
                  height: 250,
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    children: vendor.imageUrls.map((url) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(url),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
