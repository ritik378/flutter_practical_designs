import 'package:designs/common/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'app_color.dart';

class CommonUi {
  /// displaying an SVG image
  static setSvgImage(String imageName, {double? height, double? width}) {
    return SvgPicture.asset(
      'assets/svg_images/$imageName.svg',
      height: height,
      width: width,
    );
  }

  /// displaying a PNG image.
  static setPngImage(String imageName, {double? height, double? width}) {
    return Image.asset('assets/images/$imageName.png',
        height: height, width: width);
  }

  /// common text widget
  static Widget commonText(text,
      {fontSize = 24.0,
        color = AppColor.primaryColor,
        fontFamily = Fonts.semiBold}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  // Return Getx Snack Bar
  static SnackbarController showGetxSnackBar({ required String title, required String message, SnackPosition snackPosition=SnackPosition.TOP, Color backgroundColor=AppColor.lightGray}) {
    return Get.snackbar(
      title,
      message,
      margin: const EdgeInsets.all(7),
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      borderColor: AppColor.darkGray, // Set the border color here
      borderWidth: 0.5,
    );
  }

  // Return Normal Snack Bar
  static ScaffoldFeatureController showSnackBar({ String? message, Color backgroundColor=AppColor.lightGray, required BuildContext context,Color borderSideColor=AppColor.darkGray}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: 8),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: CommonUi.commonText(message, color: Colors.black, fontFamily: Fonts.regular, fontSize: 15.0),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: borderSideColor,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}