import 'package:designs/common/common_button.dart';
import 'package:designs/common/common_textfield.dart';
import 'package:designs/common/fonts.dart';
import 'package:designs/common/languages/LanguageString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_color.dart';
import '../common/common_ui.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode focusNode = FocusNode();

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
              //Space...̵
              const SizedBox(
                height: 27,
              ),
              //Signup Container...
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
                            CommonUi.commonText(LanguageString.signup.tr,
                                fontSize: 24.0,
                                color: AppColor.primaryColor,
                                fontFamily: Fonts.semiBold),
                            const SizedBox(
                              height: 8,
                            ),
                            CommonUi.commonText(
                                'It is quick and easy to Login. Enter your email and password below.',
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
                            //Space....
                            const SizedBox(
                              height: 20,
                            ),
                            //Password...
                            CommonUi.commonText('Password',
                                fontSize: 16.0,
                                fontFamily: Fonts.regular,
                                color: AppColor.darkGray),
                            //Space...
                            const SizedBox(
                              height: 8,
                            ),
                            //Password TextField
                            CommonTextField(
                              controller: passwordController,
                              hintText: "Type your password",
                              obSecure: true,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CommonUi.setSvgImage('eye'),
                              ),
                            ),
                            //Space....
                            const SizedBox(
                              height: 20,
                            ),
                            //Confirm Password...
                            CommonUi.commonText('Confirm Password',
                                fontSize: 16.0,
                                fontFamily: Fonts.regular,
                                color: AppColor.darkGray),
                            //Space...
                            const SizedBox(
                              height: 8,
                            ),
                            //Confirm Password TextField
                            CommonTextField(
                              controller: confirmPasswordController,
                              hintText: "Type your password",
                              obSecure: true,
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CommonUi.setSvgImage('eye'),
                              ),
                            ),
                            //Space..
                            const SizedBox(
                              height: 53,
                            ),
                            //Signup Button...
                            CustomButton(
                              buttonName: 'Sign up',
                              onPressed: (startLoading, stopLoading, btnState) {
                                startLoading();
                                Future.delayed(const Duration(seconds: 3), () {
                                  stopLoading();
                                });
                              },
                            ),
                            //Space....
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonUi.commonText('Already have an account?',
                                    fontSize: 12.0,
                                    fontFamily: Fonts.regular,
                                    color: AppColor.primaryColor),
                                GestureDetector(
                                  onTap: () {
                                    Get.offAllNamed('/login');
                                  },
                                  child: CommonUi.commonText('Log In',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
