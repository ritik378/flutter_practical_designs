import 'package:designs/common/common_ui.dart';
import 'package:designs/dashboard/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

   ///onItemTapped...
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
  //NavScreens...
  List<Widget> navScreens() {
    return [
      HomeView(),
      Center(child: CommonUi.commonText('My horse'),),
      Center(child: CommonUi.commonText('More'),),
    ];
  }

  //NavBars items.
  List<BottomNavigationBarItem> navBarsItems() {
    return [
      ///Home
      BottomNavigationBarItem(
        icon: CommonUi.setSvgImage('home_inactive', height: 24, width: 24),
        activeIcon: CommonUi.setSvgImage('home_active', height: 24, width: 24),
        label: 'Home',
      ),
      ///Horse...
      BottomNavigationBarItem(
        icon: CommonUi.setSvgImage('horse_bottom_inactive',
            height: 24, width: 24),
        activeIcon:
            CommonUi.setSvgImage('horse_bottom_active', height: 24, width: 24),
        label: 'Horse',
      ),
      ///More...
      BottomNavigationBarItem(
        activeIcon:
            CommonUi.setSvgImage('more_bottom_active', height: 24, width: 24),
        icon:
            CommonUi.setSvgImage('more_bottom_inactive', height: 24, width: 24),
        label: 'More',
      ),
    ];
  }
}
