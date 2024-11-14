import 'package:designs/dashboard/dashboard_view.dart';
import 'package:designs/dashboard/dashboard_binding.dart';
import 'package:designs/dashboard/home/home_binding.dart';
import 'package:designs/dashboard/home/home_view.dart';
import 'package:designs/demo_screen.dart';
import 'package:designs/forgot/forgot_view.dart';
import 'package:designs/login/login_binding.dart';
import 'package:designs/login/login_view.dart';
import 'package:designs/map/map_binding.dart';
import 'package:designs/map/map_view.dart';
import 'package:designs/navigation/app_routes.dart';
import 'package:designs/signup/signup_view.dart';
import 'package:designs/splash/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    ///Splash
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
    ),

    ///Login
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    ///Signup
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
    ),

    ///Forgot
    GetPage(
      name: AppRoutes.forgot,
      page: () => ForgotView(),
    ),

    ///Dashboard
    GetPage(
      name: AppRoutes.home,
      page: () => const DashboardView(),
      bindings: [DashboardBinding(), HomeBinding()],
    ),

    ///DemoScreen
    GetPage(
      name: AppRoutes.demoScreen,
      page: () => const DemoScreen(),
    ),

    ///MapView
    GetPage(
      name: AppRoutes.mapView,
      page: () => MapView(),
      binding: MapBinding(),
    ),
    ///home View
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
