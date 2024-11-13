import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var focusNode = FocusNode();
  var formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;

  //Email Validator...
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  //Password Validator...
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

}
