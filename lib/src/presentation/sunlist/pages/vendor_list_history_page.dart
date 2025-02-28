import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/components/custom_appbar.dart';
import 'package:flutter_sunmate/src/core/components/custom_loading_indicator.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/components/dropdown_menu.dart'
    as custom_dropdown_menu;
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/core/constants/variables.dart';
import 'package:flutter_sunmate/src/data/models/response/vendor/vendor_booking_history_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking_history/vendor_booking_history_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/vendor_history_card.dart';
import 'package:intl/intl.dart';

class VendorListHistoryPage extends StatelessWidget {
  const VendorListHistoryPage({super.key});

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
  final ScrollController scrollController = ScrollController();
  final _sheet = GlobalKey();
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  bool isClicked = false;
  BookingHistoryDataResponse? singleHistory;

  final List<DropdownMenuItem<String>> statusItems = [
    const DropdownMenuItem(
        value: 'pending', child: Text('Menunggu konfirmasi')),
    const DropdownMenuItem(
        value: 'confirmed', child: Text('Sudah dikonfirmasi')),
    const DropdownMenuItem(value: 'in_progress', child: Text('Dalam proses')),
    const DropdownMenuItem(value: 'canceled', child: Text('Dibatalkan')),
    const DropdownMenuItem(value: 'completed', child: Text('Selesai')),
  ];

  String statusOption = '';

  @override
  void initState() {
    super.initState();
    context
        .read<VendorBookingHistoryBloc>()
        .add(const VendorBookingHistoryEvent.getVendorBookingHistory());
  }

  Future<void> _refreshPage() async {
    context
        .read<VendorBookingHistoryBloc>()
        .add(const VendorBookingHistoryEvent.getVendorBookingHistory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Data Booking Vendor', canBack: true),
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: BlocListener<VendorBookingHistoryBloc,
                      VendorBookingHistoryState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          error: (message) {
                            if (message == 'logged_out') {
                              AuthLocalDatasources().removeAuthData();
                              // Schedule SnackBar display after current frame
                              SchedulerBinding.instance
                                  .addPostFrameCallback((_) {
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
                    child: BlocBuilder<VendorBookingHistoryBloc,
                        VendorBookingHistoryState>(builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const Center(
                          child: Text('Terjadi kesalahan'),
                        ),
                        loading: () {
                          return const Center(
                            child: CustomLoadingIndicator(),
                          );
                        },
                        loaded: (vendors) {
                          if (vendors.isEmpty) {
                            return const Center(
                              child: Text('Tidak ada riwayat'),
                            );
                          }
                          // return Container();
                          return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isClicked = true;
                                    singleHistory = vendors[index];
                                    statusOption = vendors[index].status!;
                                  });
                                },
                                child: VendorHistoryCard(
                                  bookingHistoryDataResponse: vendors[index],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 14.0),
                            itemCount: vendors.length,
                          );
                        },
                        error: (message) {
                          return Center(child: Text('$message'));
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
          if (isClicked)
            DraggableScrollableSheet(
                controller: sheetController,
                key: _sheet,
                initialChildSize: 0.3,
                maxChildSize: 1,
                minChildSize: 0.1,
                expand: true,
                snap: true,
                builder: (BuildContext context, scrollController) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.darkBlue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              height: 4,
                              width: 60,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                            ),
                          ),
                        ),
                        SliverList.list(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      '${Variables.baseUrl}/storage/${singleHistory!.vendorImage!}'),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    singleHistory!.vendorName!,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.darkBlue),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Kode',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          singleHistory!.code!,
                                          style: const TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Tanggal',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          DateFormat('dd MMMM yyyy')
                                              .format(singleHistory!.date!),
                                          style: const TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Nama',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          singleHistory!.userName!,
                                          style: const TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Alamat',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          singleHistory!.address!,
                                          style: const TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Status',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          singleHistory!.status! == 'pending'
                                              ? 'Menunggu konfirmasi'
                                              : singleHistory!.status! ==
                                                      'confirmed'
                                                  ? 'Dikonfirmasi'
                                                  : singleHistory!.status! ==
                                                          'in_progress'
                                                      ? 'Sedang diproses'
                                                      : singleHistory!
                                                                  .status! ==
                                                              'canceled'
                                                          ? 'Dibatalkan'
                                                          : singleHistory!
                                                                      .status! ==
                                                                  'completed'
                                                              ? 'Selesai'
                                                              : '',
                                          style: const TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Catatan',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          singleHistory!.notes!,
                                          style: const TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                custom_dropdown_menu.DropdownFormInput<String>(
                                  value: singleHistory!.status!,
                                  items: statusItems,
                                  labelText: 'Ubah Status',
                                  hintText: 'Pilih status',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Status tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      statusOption = value!;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                BlocConsumer<VendorBookingHistoryBloc,
                                    VendorBookingHistoryState>(
                                  listener: (context, state) {
                                    state.maybeWhen(
                                        orElse: () {},
                                        successUpdateBookingStatus: () {
                                          CustomSnackbar.show(context,
                                              message:
                                                  'Berhasil mengubah status.',
                                              status: 'success');

                                          setState(() {
                                            isClicked = false;
                                          });
                                          _refreshPage();
                                        },
                                        error: (message) {
                                          CustomSnackbar.show(context,
                                              message: message!,
                                              status: 'fail');
                                        });
                                  },
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      orElse: () {
                                        return Button.filled(
                                          label: 'Simpan',
                                          onPressed: () {
                                            context
                                                .read<
                                                    VendorBookingHistoryBloc>()
                                                .add(VendorBookingHistoryEvent
                                                    .updateBookingHistoryStatus(
                                                        vendorId:
                                                            singleHistory!.id!,
                                                        bookingStatus:
                                                            statusOption));
                                          },
                                        );
                                      },
                                      loading: () {
                                        return Button.filled(
                                          label: 'Loading..',
                                          onPressed: () {},
                                        );
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                              ],
                            ),
                          ),
                        ])
                      ],
                    ),
                  );
                })
        ]),
      ),
    );
  }
}
