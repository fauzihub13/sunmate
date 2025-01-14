import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sunmate/src/core/components/custom_snackbar.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/data/models/response/auth/auth_response_model.dart';
import 'package:flutter_sunmate/src/data/sources/auth/auth_local_datasources.dart';
import 'package:flutter_sunmate/src/presentation/auth/bloc/user_data/user_data_bloc.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/home/bloc/user_location/user_location_bloc.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/appbar.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/banner.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/menu_card.dart';
import 'package:flutter_sunmate/src/presentation/home/widgets/title_section.dart';
import 'package:flutter_sunmate/src/presentation/suncost/pages/suncost_main_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/bloc/vendor_list/vendor_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/pages/vendor_list_page.dart';
import 'package:flutter_sunmate/src/presentation/sunlist/widgets/list_vendor.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/bloc/news_list/news_list_bloc.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/pages/news_list_pages.dart';
import 'package:flutter_sunmate/src/presentation/sunnews/widgets/slider_news.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/pages/room_chat_page.dart';
import 'package:flutter_sunmate/src/presentation/suntalk/pages/suntalk_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    context.read<UserLocationBloc>().add(const UserLocationEvent.getWeather());
    context.read<VendorListBloc>().add(const VendorListEvent.getAllVendor());
    context.read<NewsListBloc>().add(const NewsListEvent.getNews());
    context.read<UserDataBloc>().add(const UserDataEvent.getUserData());

    await _loadAuthData();
  }

  Future<void> _refreshPage() async {
    await _initializeData();
  }

  Future<void> _loadAuthData() async {
    final authData = await AuthLocalDatasources().getAuthData();
    setState(() {
      user = authData.user;
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
            BlocListener<UserDataBloc, UserDataState>(
              listener: (context, state) {
                state.maybeWhen(
                    orElse: () {},
                    error: (message) {
                      if (message == 'logged_out') {
                        AuthLocalDatasources().removeAuthData();

                        // Schedule SnackBar display after current frame
                        SchedulerBinding.instance.addPostFrameCallback((_) {
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
              child: BlocBuilder<UserDataBloc, UserDataState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return MainAppBar(
                        avatar: null,
                        userName: user?.name ?? 'Loading...',
                      );
                    },
                    successGetUserData: (userData) {
                      AuthLocalDatasources().updateUserData(userData);
                      return MainAppBar(
                        avatar: userData.avatar,
                        userName: userData.name!,
                      );
                    },
                  );
                },
              ),
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
                              iconSize: 30,
                              iconUrl: 'assets/icons/sunlist-menu.svg'),
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const NewsListPages();
                                }));
                              },
                              title: 'SunNews',
                              iconSize: 24,
                              iconUrl: 'assets/icons/history-menu.svg'),
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SuncostMainPage();
                                }));
                              },
                              title: 'SunCost',
                              iconSize: 28,
                              iconUrl: 'assets/icons/suncost-menu.svg'),
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SuntalkPage();
                                }));
                              },
                              title: 'SunTalk',
                              iconSize: 30,
                              iconUrl: 'assets/icons/team-menu.svg'),
                          MenuCard(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const RoomChatPage();
                                }));
                              },
                              title: 'Chat',
                              iconSize: 28,
                              iconUrl: 'assets/icons/chat.svg'),
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
