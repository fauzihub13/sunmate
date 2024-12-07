import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/vendor.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/bloc/vendor_detail_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_booking_page.dart';
import 'package:flutter_svg/svg.dart';

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
      appBar: const CustomAppbar(title: 'Detail Vendor', canBack: true),
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
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, right: 4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(url),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  vendor.name,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBlue),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            colorFilter: const ColorFilter.mode(
                                AppColors.darkBlue, BlendMode.srcIn),
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            vendor.location,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            vendor.rating.toString(),
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Deskripsi',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBlue),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                vendor.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Produk',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBlue),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: vendor.products.map((product) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '- $product',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Layanan',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkBlue),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: vendor.services.map((service) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '- $service',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Button.filled(
              onPressed: () {
                context
                    .read<VendorDetailBloc>()
                    .add(VendorDetailEvent.addVendor(vendor));

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VendorBookingPage(
                    vendor: vendor,
                  );
                }));
              },
              label: 'Buat Jadwal')),
    );
  }
}
