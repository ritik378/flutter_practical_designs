import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:designs/common/app_color.dart';
import 'package:designs/common/common_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.white,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GetX Snack Bar Button
              OutlinedButton(
                onPressed: () {
                  CommonUi.showGetxSnackBar(
                    title: 'Title',
                    message: 'This is a message',
                  );
                },
                child: const Text('GetX Snack Bar'),
              ),

              /// Space...
              const SizedBox(height: 10),

              /// Normal Snack Bar Button
              OutlinedButton(
                onPressed: () {
                  CommonUi.showSnackBar(
                      message: "This is a message", context: context);
                },
                child: const Text('Normal Snack Bar'),
              ),

              /// Space...
              const SizedBox(height: 10),
              // Flush Bar Button
              OutlinedButton(
                onPressed: () {
                  Flushbar(
                    title: "Title",
                    message: "This is a message",
                    duration: const Duration(seconds: 3),
                    margin: const EdgeInsets.all(8),
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: Colors.red,
                  ).show(context);
                },
                child: const Text("Flush bar"),
              ),

              /// Styled Toast Button
              OutlinedButton(
                onPressed: () {
                  showToast(
                    'Button Pressed!',
                    context: context,
                    animation: StyledToastAnimation.slideFromBottomFade,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.bottom,
                    duration: const Duration(seconds: 4),
                    animDuration: const Duration(seconds: 1),
                    //curve: Curves.elasticOut,
                    //reverseCurve: Curves.linear,
                  );
                },
                child: const Text('Styled Toast'),
              ),
              //Normal Dialog Button
              OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Title"),
                          content: const Text("This is a message"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        );
                      });
                },
                child: const Text("Normal Dialog"),
              ),
              //GetX Dialog Button
              OutlinedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Title",
                    middleText: "This is a message",
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("OK")),
                    ],
                  );
                },
                child: const Text("Getx Dialog"),
              ),

              ///Adaptive Dialog Button
              OutlinedButton(
                onPressed: () async {
                  // Show the adaptive OK/Cancel dialog
                  final result = await showOkCancelAlertDialog(
                    context: context,
                    title: 'Confirm Action',
                    message: 'Do you want to proceed?',
                    okLabel: 'OK',
                    cancelLabel: 'Cancel',
                  );

                  // Handle the result based on what the user selects
                  if (result == OkCancelResult.ok) {
                    // Handle OK action
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('You pressed OK')));
                  } else {
                    // Handle Cancel action
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('You pressed Cancel')));
                  }
                },
                child: const Text('Adaptive Dialog'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
