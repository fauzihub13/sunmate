import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/components/empty_page.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_detail/vendor_detail_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_booking_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_list_page.dart';
import 'package:flutter_sunmate/src/presentation/sunloc/pages/sunloc_page_single.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class DetailVendor extends StatelessWidget {
  final String vendorId;
  const DetailVendor({super.key, required this.vendorId});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileView(
          vendorId: vendorId,
        );
      } else {
        return MobileView(
          vendorId: vendorId,
        );
      }
    });
  }
}

class MobileView extends StatefulWidget {
  final String vendorId;
  const MobileView({super.key, required this.vendorId});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  void initState() {
    super.initState();
    context
        .read<VendorListBloc>()
        .add(VendorListEvent.getDetailVendor(vendorId: widget.vendorId));
  }

  Future<void> _refreshPage() async {
    context
        .read<VendorListBloc>()
        .add(VendorListEvent.getDetailVendor(vendorId: widget.vendorId));
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Detail Vendor',
        canBack: true,
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const VendorListPage()),
            (route) => route.isFirst,
          );
        },
      ),
      body: SafeArea(
          child: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.white,
        onRefresh: _refreshPage,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocConsumer<VendorListBloc, VendorListState>(
            listener: (context, state) {
              state.maybeWhen(
                  orElse: () {},
                  error: (message) {
                    if (message == 'logged_out') {
                      AuthLocalDatasources().removeAuthData();

                      // Schedule SnackBar display after current frame
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        CustomSnackbar.show(context,
                            message: 'Silahkan login kembali.', status: 'fail');

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
              }, detailVendorLoaded: (vendor) {
                return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Scrollbar(
                        controller: scrollController,
                        child: Container(
                          height: 250,
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            controller: scrollController,
                            children: vendor.vendorImages!.map((image) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0, right: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      '${Variables.baseUrl}/storage/${image.path!}'),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          vendor.name!,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/location.svg',
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.darkBlue, BlendMode.srcIn),
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Expanded(
                                    child: Text(
                                      vendor.address!,
                                      style: const TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ReadMoreText(
                          vendor.description!,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          vendor.product ?? '-',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey),
                        ),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          vendor.service ?? '-',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
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
      )),
      bottomNavigationBar: BlocConsumer<VendorListBloc, VendorListState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading..',
                    style: TextStyle(color: AppColors.grey),
                  ),
                ],
              ),
            );
          }, detailVendorLoaded: (vendor) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SunlocPageSingle(
                          vendor: vendor,
                        );
                      }));
                    },
                    child: const SizedBox(
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) {
                  //       return SunlocPageSingle(
                  //         vendor: vendor,
                  //       );
                  //     }));
                  //   },
                  //   child: const SizedBox(
                  //     child: Icon(
                  //       Icons.chat,
                  //       size: 34,
                  //       color: AppColors.primary,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  Expanded(
                    child:
                        Button.outlined(onPressed: () {}, label: 'Kirim Pesan'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Button.filled(
                        onPressed: () {
                          context
                              .read<VendorDetailBloc>()
                              .add(VendorDetailEvent.addVendor(vendor));

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VendorBookingPage(
                              vendor: vendor,
                            );
                          }));
                        },
                        label: 'Buat Jadwal'),
                  ),
                ]));
          });
        },
      ),
    );
  }
}
