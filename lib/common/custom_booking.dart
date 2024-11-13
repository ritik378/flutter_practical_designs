import 'package:designs/common/app_color.dart';
import 'package:designs/common/common_ui.dart';
import 'package:designs/common/fonts.dart';
import 'package:flutter/material.dart';

class CustomBooking extends StatelessWidget {
  const CustomBooking(
      {super.key, this.title, this.date, this.time, this.subTitle,this.isLast = false,});

  final String? title;
  final String? date;
  final String? time;
  final String? subTitle;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Time Row....
        Row(
          children: [
            ///Livery yard
            CommonUi.commonText(title,
                fontFamily: Fonts.semiBold,
                fontSize: 12.0,
                color: AppColor.deepCharcoal),
            //Spacer....
            const Spacer(),

            ///Time
            CommonUi.commonText(time,
                fontSize: 12.0,
                fontFamily: Fonts.semiBold,
                color: AppColor.deepCharcoal),
          ],
        ),

        ///Date Row...
        Row(
          children: [
            ///Livery yard
            CommonUi.commonText(subTitle,
                fontFamily: Fonts.regular,
                fontSize: 12.0,
                color: AppColor.deepCharcoal),

            ///Spacer...
            const Spacer(),

            ///Date
            CommonUi.commonText(date,
                fontSize: 8.0,
                fontFamily: Fonts.medium,
                color: AppColor.deepCharcoal),
          ],
        ),

        ///Space..
        const SizedBox(
          height: 4,
        ),
        if (!isLast) ...[
          const Divider(color: AppColor.mistyGray, thickness: 0.5),
          const SizedBox(height: 4),
        ],
      ],
    );
  }
}
