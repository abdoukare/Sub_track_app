import 'package:get/get.dart';
import 'package:task5/features/auth/views/OnboardingScreen.dart';
import 'package:task5/features/subscriptions/viewmodels/home.dart';
import 'package:task5/features/auth/views/login_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/sign-in', page: () => LoginView()),
    GetPage(name: '/sign-out', page: () => LoginView()),
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/onboarding', page: () => Onboardingscreen()),
  ];
}
