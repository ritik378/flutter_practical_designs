import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:designs/common/app_color.dart';
import 'package:designs/dashboard/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.white,
      child:Obx(()=> Scaffold(
        backgroundColor: AppColor.white,
        body: dashboardController.navScreens[dashboardController.selectedIndex.value],
        bottomNavigationBar:  BottomNavigationBar(
            selectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
              decoration: TextDecoration.underline,
            ),
            items: dashboardController.navBarsItems(),
            selectedItemColor: AppColor.primaryColor,
            currentIndex: dashboardController.selectedIndex.value,
            onTap: (index) {
              dashboardController.onItemTapped(index);
              GetStorage().read('isLogin');
            },
          ),
        ),

    ),);
  }
}
