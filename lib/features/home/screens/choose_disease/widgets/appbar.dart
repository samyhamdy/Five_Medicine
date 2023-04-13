import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/components/app_text.dart';
import '../../../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_fonts.dart';

class ChooseDiseaseAppBar {
  static appBar(
    BuildContext context,
    String title,
  ) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 18.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
      backgroundColor: AppColors.white,
      flexibleSpace: Container(
        decoration: BoxDecoration(color: AppColors.white),
      ),
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: AppText(
          title,
          fontSize: 22.sp,
          fontFamily: FontConstants.neoSansArabicRegular,
          color: AppColors.primarycolor,
          fontWeight: FontWeight.w700,
          maxLines: 2,
        ),
      ),
    );
  }
}
