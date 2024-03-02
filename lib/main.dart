import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/splash_screen.dart';
import 'router.dart' as router;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => const GetMaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: router.Router.generateRoute,
              home: SplashScreen(),
            ));
  }
}
