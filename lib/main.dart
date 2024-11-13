import 'package:designs/navigation/app_pages.dart';
import 'package:designs/navigation/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'common/languages/translation_services.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  // final translationService = TranslationService();
  // await translationService.loadTranslations();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.routes,
      translationsKeys: TranslationService().translations,
      locale: const Locale('en', 'US'),
      // defaultTransition: Get.defaultTransition,
    );
  }
}
