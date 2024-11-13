import 'package:designs/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_btn/loading_btn.dart';
import 'fonts.dart';

class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final String buttonName;
  final double? buttonNameSize;
  final Color? buttonNameColor;
  final double? buttonHeight;
  final Function(
          Function startLoading, Function stopLoadig, ButtonState btnState)
      onPressed;

  const CustomButton({
    super.key,
    required this.buttonName,
    this.buttonColor = AppColor.primaryColor,
    this.buttonNameColor = AppColor.white,
    this.buttonHeight = 48.0,
    this.buttonNameSize = 16.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      height: buttonHeight ?? 48.0,
      width: Get.width,
      borderRadius: 94.0,
      loader: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
      color: buttonColor ?? AppColor.primaryColor,
      borderSide: BorderSide.none,
      //Button Name
      child: Text(
        buttonName,
        style: TextStyle(
            color: buttonNameColor,
            fontSize: buttonNameSize,
            fontFamily: Fonts.semiBold),
      ),
      onTap: (startLoading, stopLoading, btnState) async {
        onPressed.call(startLoading, stopLoading, btnState);
      },
    );
  }
}
