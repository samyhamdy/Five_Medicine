import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:os_project/core/components/app_text.dart';
import 'package:os_project/core/components/navig.dart';
import 'package:os_project/core/resources/app_assets.dart';
import 'package:os_project/core/resources/app_colors.dart';
import 'package:os_project/core/resources/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/resources/app_fonts.dart';
import '../../diseases_screens/screens/diabetes_screen.dart';
import '../../diseases_screens/screens/heart_screen.dart';
import '../../diseases_screens/screens/parkinson_screen.dart';
import '../widgets/appbar.dart';

class ChooseDiseaseScreen extends StatefulWidget {
  const ChooseDiseaseScreen({super.key});

  @override
  State<ChooseDiseaseScreen> createState() => _ChooseDiseaseScreenState();
}

List disease = [
  AppStrings.diabetes,
  AppStrings.heart,
  AppStrings.parkinson,
];
List diseaseicons = [
  AppAssets.diabets,
  AppAssets.heart,
  AppAssets.parkinson,
];
List<Widget> diseasescreens = const [
  DiabetesScreen(),
  HeartScreen(),
  ParkinsonScreen(),
];

class _ChooseDiseaseScreenState extends State<ChooseDiseaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChooseDiseaseAppBar.appBar(context, AppStrings.homeTitle),
        body: _buildBodycontent());
  }

  Widget _buildBodycontent() {
    return WillPopScope(
      onWillPop: () async {
        _onBackPressed(context);
        return false;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            Divider(
              color: AppColors.primarycolor,
              thickness: 1.5,
            ),
            SizedBox(
              height: 30.h,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        switch (index) {
                          case 0:
                            const DiabetesScreen().Push(
                                context: context,
                                type: PageTransitionType.leftToRight);
                            break;
                          case 1:
                            const HeartScreen().Push(
                                context: context,
                                type: PageTransitionType.leftToRight);
                            break;
                          case 2:
                            const ParkinsonScreen().Push(
                                context: context,
                                type: PageTransitionType.leftToRight);
                            break;
                          default:
                        }
                      },
                      child:
                          bodyItem(diseaseicons[index], disease[index], index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 0,
                    );
                  },
                  itemCount: diseaseicons.length),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyItem(String diseaseicon, String diseasename, index) {
    return SizedBox(
      height: 10.h,
      child: Row(
        children: [
          Image.asset(
            diseaseicon,
            color: AppColors.diseasecontentColor,
          ),
          SizedBox(
            width: 3.w,
          ),
          AppText(
            diseasename,
            color: AppColors.diseasecontentColor,
            fontSize: 12.sp,
          )
        ],
      ),
    );
  }

  _onBackPressed(context) {
    return showDialog(
        context: context,
        // barrierColor: Colors.white,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: AppText(
              AppStrings.closeapp,
              fontSize: 11.sp,
              fontFamily: FontConstants.neoSansArabicRegular,
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primarycolor),
                  onPressed: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
                  child: AppText(
                    AppStrings.yes,
                    fontSize: 15,
                    fontFamily: FontConstants.neoSansArabicRegular,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primarycolor),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: AppText(
                    AppStrings.no,
                    fontSize: 15,
                    fontFamily: FontConstants.neoSansArabicRegular,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
