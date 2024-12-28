import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/home/bloc/user_location/user_location_bloc.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/appbar.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/banner.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/menu_card.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/title_section.dart';
import 'package:flutter_sunmate/src/presentation/suncost/pages/suncost_main_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_booking_history.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_list_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/list_vendor.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/pages/news_list_pages.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/widgets/slider_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;

  @override
  void initState() {
    context.read<UserLocationBloc>().add(const UserLocationEvent.getWeather());
    AuthLocalDatasources().getAuthData().then((value) {
      setState(() {
        user = value.user;
      });
    });
    super.initState();
  }

  Future<void> _refreshPage() async {
    context.read<UserLocationBloc>().add(const UserLocationEvent.getWeather());
    AuthLocalDatasources().getAuthData().then((value) {
      setState(() {
        user = value.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.lightBlue,
        onRefresh: _refreshPage,
        child: Column(
          children: [
            MainAppBar(
              userName: user?.name ?? '',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<UserLocationBloc, UserLocationState>(
                        builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const HomeBanner(
                              temperature: 0, location: '-', weather: '-');
                        },
                        loading: () {
                          return const HomeBanner(
                              temperature: 0, location: '-', weather: '-');
                        },
                        locationLoaded: (position) {
                          return Text('lat: $position');
                        },
                        weatherLoaded: (weather) {
                          if (weather.weather != null &&
                              weather.weather!.isNotEmpty) {
                            return HomeBanner(
                                temperature: weather.main!.temp! - 273,
                                location: weather.name!,
                                weather: weather.weather![0].main!);
                          } else {
                            return const HomeBanner(
                                temperature: 0, location: '-', weather: '-');
                          }
                        },
                        error: (error) {
                          return const HomeBanner(
                              temperature: 0, location: '-', weather: '-');
                        },
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const VendorListPage();
                                }));
                              },
                              title: 'SunList',
                              iconSize: 38,
                              iconUrl: 'assets/icons/sunlist-menu.svg'),
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const NewsListPages();
                                }));
                              },
                              title: 'SunNews',
                              iconSize: 32,
                              iconUrl: 'assets/icons/history-menu.svg'),
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SuncostMainPage();
                                }));
                              },
                              title: 'SunCost',
                              iconSize: 36,
                              iconUrl: 'assets/icons/suncost-menu.svg'),
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const VendorBookingHistory();
                                }));
                              },
                              title: 'Riwayat',
                              iconSize: 34,
                              iconUrl: 'assets/icons/history-clock-menu.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
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
                    BlocListener<LogoutBloc, LogoutState>(
                      listener: (context, state) {
                        state.maybeWhen(
                            orElse: () {},
                            success: () {
                              AuthLocalDatasources().removeAuthData();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Berhasil logout',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: AppColors.green,
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false,
                              );
                            },
                            error: (message) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    message,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: AppColors.red,
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            });
                      },
                      child: Button.outlined(
                        label: 'Logout',
                        onPressed: () async {
                          final authData =
                              await AuthLocalDatasources().getAuthData();
                          if (context.mounted) {
                            context.read<LogoutBloc>().add(
                                LogoutEvent.logout(token: authData.token!));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
