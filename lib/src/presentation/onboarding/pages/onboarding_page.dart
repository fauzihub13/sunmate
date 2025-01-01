import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/components/buttons.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';
import 'package:flutter_sunmate/src/presentation/auth/pages/login_page.dart';
import 'package:flutter_sunmate/src/presentation/onboarding/widgets/onboarding_items.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final onBoardingItems = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: AppColors.white,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                        final press = await SharedPreferences.getInstance();
                        press.setBool('onboarding', true);
                        final currentContext = context;
                        if (currentContext.mounted) {
                          // print('Status onboarding: ${press.getBool('onboarding')}');
                          Navigator.push(currentContext,
                              MaterialPageRoute(builder: (context) {
                            return const LoginPage();
                          }));
                        }
                      },
                      child: const Text(
                        'Lewati',
                        style: TextStyle(color: AppColors.primary),
                      )),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onBoardingItems.items.length,
                    effect: const WormEffect(
                        dotHeight: 6,
                        dotWidth: 24,
                        activeDotColor: AppColors.primary,
                        dotColor: AppColors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        size: 34,
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
      ),
      body: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              isLastPage = onBoardingItems.items.length - 1 == index;
            });
          },
          itemCount: onBoardingItems.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 240,
                    child: Image.asset(onBoardingItems.items[index].image),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  Text(onBoardingItems.items[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    onBoardingItems.items[index].description,
                    style: const TextStyle(
                        color: AppColors.darkBlue, fontSize: 16),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget getStarted() {
    return Button.filled(
      label: 'Mulai',
      onPressed: () async {
        final press = await SharedPreferences.getInstance();
        press.setBool('onboarding', true);
        final currentContext = context;
        if (currentContext.mounted) {
          // print('Status onboarding: ${press.getBool('onboarding')}');
          Navigator.push(currentContext, MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }));
        }
      },
    );
  }
}
