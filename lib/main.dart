import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/auth_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/booking_vendor_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/news_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/suncost_local_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/user_location_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/vendor_remote_datasources.dart';
import 'package:flutter_sunmate/src/data/sources/weather_remote_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/home/bloc/user_location/user_location_bloc.dart';
import 'package:flutter_sunmate/src/presentation/home/pages/landing_page.dart';
import 'package:flutter_sunmate/src/presentation/suncost/bloc/suncost_calculate/suncost_calculate_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking/vendor_booking_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_booking_history/vendor_booking_history_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_detail/vendor_detail_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/bloc/news_list/news_list_bloc.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          create: (context) => LoginBloc(AuthRemoteDatasources(
              authLocalDatasources: AuthLocalDatasources(),
              client: http.Client())),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasources(
              authLocalDatasources: AuthLocalDatasources(),
              client: http.Client())),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDatasources(
              authLocalDatasources: AuthLocalDatasources(),
              client: http.Client())),
        ),
        BlocProvider(
          create: (context) => VendorListBloc(VendorRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => NewsListBloc(NewsRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => UserLocationBloc(
              UserLocationDatasource(), WeatherRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => SuncostCalculateBloc(SuncostLocalDatasources()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
                  return const LandingPage();
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
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
