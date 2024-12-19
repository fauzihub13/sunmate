import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/auth_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/booking_vendor_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/news_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/vendor_remote_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/home/pages/home_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking/vendor_booking_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking_history/vendor_booking_history_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_detail/vendor_detail_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/bloc/news_list/news_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VendorDetailBloc(),
        ),
        BlocProvider(
          create: (context) =>
              VendorBookingBloc(BookingVendorRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) =>
              VendorBookingHistoryBloc(BookingVendorRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => VendorListBloc(VendorRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => NewsListBloc(NewsRemoteDatasources()),
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
        home: FutureBuilder<bool>(
            future: AuthLocalDatasources().isAuthDataExist(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                    body: Center(
                  child: CircularProgressIndicator(),
                ));
              }
              if (snapshot.hasData) {
                if (snapshot.data!) {
                  return const HomePage();
                } else {
                  return const LoginPage();
                }
              }
              return const Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              );
            }),
        builder: (context, child) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 976,
              ),
              child: child ?? SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
