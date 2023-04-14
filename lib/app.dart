import 'package:flutter/material.dart';
import 'package:os_project/core/resources/app_colors.dart';

import 'package:sizer/sizer.dart';
import 'features/intro/splash/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
            theme: ThemeData(primaryColor: AppColors.primarycolor),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen());
      },
    );
  }
