import 'dart:ffi';

import 'package:designs/common/app_color.dart';
import 'package:designs/common/common_ui.dart';
import 'package:designs/common/fonts.dart';
import 'package:flutter/material.dart';

class CustomLocation extends StatelessWidget {
  const CustomLocation(this.image,
      {super.key,
      this.title = '',
      this.location = '',
      this.subTitle = '',
      this.price = ''});

  final String image;
  final String title;
  final String location;
  final String subTitle;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
          BoxShadow(
            color: AppColor.lightBlack,
            offset: Offset(0.0, 0.0),
            blurRadius: 5.0,
          ),
        ]),
        child: Row(
          children: [
            CommonUi.setPngImage(image, height: 64.0, width: 60.0),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonUi.commonText(
                    title,
                    fontSize: 12.0,
                    fontFamily: Fonts.semiBold,
                  ),
                  Row(
                    children: [
                      ///Location Icon....
                      CommonUi.setSvgImage('location', height: 9, width: 7),

                      ///Space
                      const SizedBox(
                        width: 4,
                      ),
                      CommonUi.commonText(
                        location,
                        fontSize: 10.0,
                        fontFamily: Fonts.semiBold,
                      )
                    ],
                  ),

                  ///Prise Row....
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonUi.commonText(subTitle,
                          fontSize: 10.0, fontFamily: Fonts.regular),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Starting at ',
                              style: TextStyle(
                                color: AppColor.deepCharcoal,
                                fontSize: 10.0,
                                fontFamily: Fonts.regularItalic,
                              ),
                            ),
                            TextSpan(
                              text: '\$$price',
                              style: const TextStyle(
                                color: AppColor.deepCharcoal,
                                fontSize: 10.0,
                                fontFamily: Fonts.boldItalic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
