import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:designs/common/app_color.dart';
import 'package:designs/common/common_ui.dart';
import 'package:designs/common/custom_booking.dart';
import 'package:designs/common/fonts.dart';
import 'package:designs/common/languages/custom_location.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<CustomBooking> bookingList = [
    const CustomBooking(
      title: 'Livery Yard',
      date: '12 Oct 2024',
      time: '07:30PM',
      subTitle: 'Riding arena',
    ),
    const CustomBooking(
      title: 'Starlight Stables',
      date: '28 Oct 2024',
      time: '07:30PM',
      subTitle: 'Echo Valley Arena',
    ),
    const CustomBooking(
      title: 'Whispering Pines',
      date: '12 Oct 2024',
      time: '07:30PM',
      subTitle: 'Echo Valley Arena',
    ),
  ];

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
              Row(
                children: [
                  Column(
                    children: [
                      ///Hello, Sarah
                      CommonUi.commonText('Hello, Sarah',
                          fontFamily: Fonts.semiBold, fontSize: 12.0),

                      ///Space....
                      const SizedBox(height: 4),

                      ///Good Morning...
                      CommonUi.commonText('Good Morning!',
                          fontFamily: Fonts.regular, fontSize: 10.0),
                    ],
                  ),

                  ///Spacer....
                  const Spacer(),

                  ///Bell
                  CommonUi.setSvgImage('bell', height: 22, width: 22),
                ],
              ),

              ///Space...
              const SizedBox(
                height: 24,
              ),

              ///Booking Container...
              Container(
                height: 179,
                width: double.infinity,
                color: AppColor.softSky,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///My Bookings...
                      CommonUi.commonText('My Bookings',
                          fontFamily: Fonts.semiBold,
                          fontSize: 14.0,
                          color: AppColor.deepCharcoal),

                      ///Space...
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: bookingList.length,
                            itemBuilder: (context, index) {
                              return CustomBooking(
                                title: bookingList[index].title,
                                date: bookingList[index].date,
                                time: bookingList[index].time,
                                subTitle: bookingList[index].subTitle,
                                isLast: index == bookingList.length - 1,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),

              ///Space...
              const SizedBox(
                height: 20,
              ),

              ///View All Row
              Row(
                children: [
                  CommonUi.commonText(
                    'Near by arenas',
                    fontFamily: Fonts.semiBold,
                    fontSize: 14.0,
                  ),

                  ///Spacer...
                  const Spacer(),

                  ///View All
                  CommonUi.commonText(
                    'View All',
                    fontFamily: Fonts.medium,
                    fontSize: 10.0,
                  ),
                ],
              ),

              ///Space..
              const SizedBox(
                height: 10,
              ),

              ListView(
                shrinkWrap: true,
                children: [
                  const CustomLocation(
                    'thunder',
                    title: 'Thunderhoof Arena',
                    location: 'Marshall, Virginia',
                    subTitle: 'Sunset Grove',
                    prise: '50',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
