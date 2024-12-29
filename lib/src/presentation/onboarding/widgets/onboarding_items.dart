import 'package:flutter_sunmate/src/presentation/onboarding/models/onboarding_models.dart';

class OnboardingItems {
  List<OnboardingModels> items = [
    const OnboardingModels(
        image: 'assets/images/onboarding/onboarding-1.png',
        title: 'Selamat Datang di SunMate',
        description: 'Mitra terpercaya Anda untuk solusi panel surya.'),
    const OnboardingModels(
        image: 'assets/images/onboarding/onboarding-2.png',
        title: 'Temukan Vendor Terdekat',
        description: 'Jelajahi dan bandingkan vendor di dekat Anda dengan mudah.'),
    const OnboardingModels(
        image: 'assets/images/onboarding/onboarding-3.png',
        title: 'Informasi Cuaca Terkini',
        description: 'Dapatkan prakiraan cuaca terkini untuk memaksimalkan efisiensi surya Anda.'),
  ];
}
