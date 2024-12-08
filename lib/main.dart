import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/data/sources/booking_vendor_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/home/pages/home_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking/vendor_booking_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking_history/vendor_booking_history_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_detail/vendor_detail_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VendorDetailBloc(),
        ),
        BlocProvider(
          create: (context) => VendorBookingBloc(),
        ),
        BlocProvider(
          create: (context) =>
              VendorBookingHistoryBloc(BookingVendorLocalDatasources.instance),
        ),
      ],
      child: MaterialApp(
        title: 'SunMate',
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
