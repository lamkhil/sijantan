import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/global/binding/core_binding.dart';
import 'app/global/utils/pallete.dart';
import 'app/routes/app_pages.dart';

int defaultDataYear = 2022;

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return GetMaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Palette.toDark,
              splashColor: Colors.transparent,
              navigationBarTheme: NavigationBarThemeData(
                backgroundColor: Colors.white,
                indicatorColor: const Color(0XFF0F77BF).withOpacity(0.3),
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialBinding: CoreBinding(),
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        });
  }
}
