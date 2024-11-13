import 'package:designs/common/fonts.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.height = 48.0,
    this.width = double.infinity,
    this.hintColor = AppColor.secondaryColor,
    this.textColor = AppColor.darkGray,
    this.backgroundColor = AppColor.lightBlue,
    this.borderColor = AppColor.lightGray,
    this.suffixIcon,
    this.prefixIcon,
    this.isFilled = true,
    this.obSecure = false,
    this.maxLines = 1,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.validator,
    this.textCapitalization=TextCapitalization.none,
  });

  final TextEditingController controller;
  final double height;
  final double width;
  final Color hintColor;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isFilled;
  final bool obSecure;
  final int maxLines;
  final bool readOnly;
  final TextInputType keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obSecure,
      validator: validator,
      style: TextStyle(
        color: textColor,
        fontFamily: Fonts.medium,
        fontSize: 14.0,
      ),
      maxLines: maxLines,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      inputFormatters: const [],
      decoration: InputDecoration(
        hintText: hintText,
        filled: isFilled,
        hintStyle: TextStyle(
          color: hintColor,
          fontFamily: Fonts.regular,
          fontSize: 14.0,
        ),
        fillColor: isFilled ? backgroundColor : null,
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffixIcon ?? null,

        ///Enabled Border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor), // Set border color
        ),

        ///Focused Border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor), // Set border color
        ),
        // prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor), // Set border color
        ),
      ),
    );
  }
}
