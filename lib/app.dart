import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholr/core/theme/dark_theme.dart';
import 'package:scholr/core/theme/light_theme.dart';
import 'package:scholr/routes/app_pages.dart';
import 'package:scholr/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Scholr",
      initialRoute: AppRoutes.onBoarding,
      getPages: AppPages.routes,

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,

    );
  }
}