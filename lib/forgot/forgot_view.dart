import 'package:designs/common/app_color.dart';
import 'package:designs/common/common_button.dart';
import 'package:designs/common/common_textfield.dart';
import 'package:designs/common/common_ui.dart';
import 'package:designs/common/fonts.dart';
import 'package:designs/common/languages/LanguageString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotView extends StatelessWidget {
  ForgotView({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Horse Logo...
              CommonUi.setSvgImage('horse_logo', height: 108.65, width: 67.84),
              //Space...
              const SizedBox(
                height: 27,
              ),
              //Forgot Container...
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Forgot Password...
                            CommonUi.commonText(
                              LanguageString.forgot.tr,
                            ),
                            //Space....
                            const SizedBox(
                              height: 8,
                            ),
                            CommonUi.commonText(
                                'Enter the email associated with your account and we’ll send an email with code to reset your password.',
                                fontSize: 12.0,
                                fontFamily: Fonts.regular),
                            //Space....
                            const SizedBox(
                              height: 24,
                            ),
                            //Email.....
                            CommonUi.commonText('Email',
                                fontSize: 16.0,
                                fontFamily: Fonts.regular,
                                color: AppColor.darkGray),
                            //Space...
                            const SizedBox(
                              height: 8,
                            ),
                            //Email TextField
                            CommonTextField(
                                controller: emailController,
                                hintText: "Type your email"),
                            //Space...
                            const SizedBox(
                              height: 226,
                            ),
                            //Confirm Button...
                            CustomButton(
                                buttonName: 'Confirm',
                                onPressed:
                                    (startLoading, stopLoading, btnState) {}),
                            //Space...
                            const SizedBox(
                              height: 15,
                            ),
                            //Don't have an account? Sign Up...
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonUi.commonText('Don’t have an account?',
                                    fontSize: 12.0,
                                    fontFamily: Fonts.regular,
                                    color: AppColor.primaryColor),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/signup');
                                  },
                                  child: CommonUi.commonText('Sign Up',
                                      fontSize: 12.0,
                                      fontFamily: Fonts.semiBold,
                                      color: AppColor.primaryColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
