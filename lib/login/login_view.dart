import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:designs/common/app_color.dart';
import 'package:designs/common/app_string.dart';
import 'package:designs/common/common_button.dart';
import 'package:designs/common/common_textfield.dart';
import 'package:designs/common/common_ui.dart';
import 'package:designs/common/fonts.dart';
import 'package:designs/common/languages/LanguageString.dart';
import 'package:designs/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      bottom: false,
      child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///Horse Logo...
                CommonUi.setSvgImage('horse_logo',
                    height: 108.65, width: 67.84),

                ///Space...̵
                const SizedBox(
                  height: 27,
                ),

                ///Login Container...
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
                            topRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: loginController.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Login Text...
                                CommonUi.commonText(
                                  LanguageString.login.tr,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),

                                ///Its quick and easy to login...
                                CommonUi.commonText(
                                    'It is quick and easy to Login. Enter your email and password below.',
                                    fontSize: 12.0,
                                    fontFamily: Fonts.regular),

                                ///Space....
                                const SizedBox(
                                  height: 24,
                                ),

                                ///Email.....
                                CommonUi.commonText('Email',
                                    fontSize: 16.0,
                                    fontFamily: Fonts.regular,
                                    color: AppColor.darkGray),
                                //Space...
                                const SizedBox(
                                  height: 8,
                                ),

                                ///Email TextField
                                CommonTextField(
                                  controller: loginController.emailController,
                                  hintText: "Type your email",
                                  validator: (value) {
                                    return loginController
                                        .emailValidator(value);
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                ///Space....
                                const SizedBox(
                                  height: 20,
                                ),
                                ///Password...
                                CommonUi.commonText('Password',
                                    fontSize: 16.0,
                                    fontFamily: Fonts.regular,
                                    color: AppColor.darkGray),

                                ///Space...
                                const SizedBox(
                                  height: 8,
                                ),

                                ///TextField Password
                                Obx(() {
                                  return CommonTextField(
                                    controller:
                                        loginController.passwordController,
                                    hintText: "Type your password",
                                    validator: (value) {
                                      return loginController
                                          .passwordValidator(value);
                                    },
                                    obSecure: !loginController
                                        .isPasswordVisible.value,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        loginController
                                                .isPasswordVisible.value =
                                            !loginController
                                                .isPasswordVisible.value;
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: loginController
                                                .isPasswordVisible.value
                                            ? CommonUi.setPngImage('eye',
                                                height: 20, width: 20)
                                            : CommonUi.setPngImage('eye_close',
                                                height: 20, width: 20),
                                      ),
                                    ),
                                  );
                                }),
                                ///Space....
                                const SizedBox(
                                  height: 12,
                                ),
                                ////Forgot Password Row
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/forgot');
                                      },
                                      child: CommonUi.commonText(
                                          'Forgot password?',
                                          fontSize: 12.0,
                                          fontFamily: Fonts.regular,
                                          color: AppColor.primaryColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 94,
                                ),

                                ///Login Button...
                                CustomButton(
                                  buttonName: 'Log in',
                                  onPressed: (startLoading, stopLoading,
                                      btnState) async {
                                    if (loginController.formKey.currentState!
                                        .validate()) {
                                      startLoading();
                                      await Future.delayed(
                                        const Duration(seconds: 1),
                                        () {
                                          stopLoading();
                                          GetStorage()
                                              .write(AppString.isLogin, true);
                                        },
                                      );
                                      ///Navigate to Home Page....
                                      Get.offAllNamed('/dashboard');
                                    }
                                  },
                                ),
                                ///Space....
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonUi.commonText(
                                        'Don’t have an account?',
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
                ),
              ],
            ),
          )),
    );
  }
}
