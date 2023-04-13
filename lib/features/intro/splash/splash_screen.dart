import 'dart:async';

import 'package:flutter/material.dart';

import 'package:os_project/core/components/app_text.dart';
import 'package:os_project/core/components/navig.dart';
import 'package:os_project/core/resources/app_assets.dart';
import 'package:os_project/core/resources/app_colors.dart';
import 'package:os_project/core/resources/app_fonts.dart';
import 'package:os_project/core/resources/app_strings.dart';
import 'package:os_project/core/utils/locator_utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../auth/screens/authentication_screen.dart';
import '../../home/screens/choose_disease/screens/choose_disease.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget _buildbodycontent() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            AppAssets.splash,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.w),
            child: Center(
              child: AppText(
                AppStrings.splashcontnet,
                color: AppColors.primarycolor,
                fontFamily: FontConstants.neoSansArabicRegular,
                fontSize: 28.sp,
                fontWeight: FontWeightManager.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(body: _buildbodycontent());
  }

  init(BuildContext context) {
    Timer(const Duration(seconds: 4), () => getdata(context));
  }

  getdata(context) {
    if (LocatorUtils().pref().isAuthenticated) {
      const ChooseDiseaseScreen().PushAndReplace(
          context: context, type: PageTransitionType.leftToRight);
    } else {
      const Authentication().PushAndReplace(
          context: context, type: PageTransitionType.leftToRight);
    }
  }
}
