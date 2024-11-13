import 'package:designs/common/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../common/common_ui.dart';
import '../navigation/app_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonUi.setSvgImage('splash_logo'),
      ),
    );
  }

  void navigation() {
    Future.delayed(const Duration(seconds: 2), () {
      if (GetStorage().read(AppString.isLogin) == null ||
          GetStorage().read(AppString.isLogin) == false) {
        Get.offNamed(AppRoutes.login);
      } else {
        Get.offNamed(AppRoutes.home);
      }
    });
  }
}
