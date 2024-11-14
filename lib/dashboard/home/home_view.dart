import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:designs/common/app_color.dart';
import 'package:designs/common/common_ui.dart';
import 'package:designs/common/custom_booking.dart';
import 'package:designs/common/fonts.dart';
import 'package:designs/dashboard/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A stateless widget that represents the home view of the application.
class HomeView extends StatelessWidget {
  HomeView({super.key});

  /// The controller for managing the state and logic of the home view.
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.white,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Row containing greeting text and a notification icon.
              Row(
                children: [
                  Column(
                    children: [
                      CommonUi.commonText('Hello, Sarah',
                          fontFamily: Fonts.semiBold, fontSize: 12.0),
                      const SizedBox(height: 4),
                      CommonUi.commonText('Good Morning!',
                          fontFamily: Fonts.regular, fontSize: 10.0),
                    ],
                  ),
                  const Spacer(),
                  CommonUi.setSvgImage('bell', height: 22, width: 22),
                ],
              ),

              const SizedBox(
                height: 24,
              ),

              /// Container displaying the user's bookings.
              Container(
                height: 179,
                width: double.infinity,
                color: AppColor.softSky,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonUi.commonText('My Bookings',
                          fontFamily: Fonts.semiBold,
                          fontSize: 14.0,
                          color: AppColor.deepCharcoal),

                      const SizedBox(
                        height: 12,
                      ),

                      /// List of bookings.
                      Expanded(
                        child: Obx(() {
                          return ListView.builder(
                            itemCount: homeController.bookingList.length,
                            itemBuilder: (context, index) {
                              return CustomBooking(
                                title: homeController.bookingList[index].title,
                                date: homeController.bookingList[index].date,
                                time: homeController.bookingList[index].time,
                                subTitle: homeController.bookingList[index]
                                    .subTitle,
                                isLast: index ==
                                    homeController.bookingList.length - 1,
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// Row containing a title and a "View All" option for nearby arenas.
              Row(
                children: [
                  CommonUi.commonText(
                    'Near by arenas',
                    fontFamily: Fonts.semiBold,
                    fontSize: 14.0,
                  ),
                  const Spacer(),
                  CommonUi.commonText(
                    'View All',
                    fontFamily: Fonts.medium,
                    fontSize: 10.0,
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              /// List of nearby locations.
              Obx(() {
                return Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: homeController.locations.map((location) {
                      return location;
                    }).toList(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}