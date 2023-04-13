// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/components/app_button.dart';
import '../../../../../core/components/text_form_field.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_fonts.dart';
import '../../../../../core/resources/app_strings.dart';
import '../../choose_disease/widgets/appbar.dart';

class ParkinsonScreen extends StatefulWidget {
  const ParkinsonScreen({super.key});

  @override
  State<ParkinsonScreen> createState() => _ParkinsonScreenState();
}

class _ParkinsonScreenState extends State<ParkinsonScreen> {
  final TextEditingController _MDVPHzController = TextEditingController();
  final TextEditingController _MDVP_percent_Controller =
      TextEditingController();
  final TextEditingController _MDVP_AbsController = TextEditingController();
  final TextEditingController _MDVPController = TextEditingController();
  final TextEditingController _JitterController = TextEditingController();
  final TextEditingController _ShimmerController = TextEditingController();
  final TextEditingController _NHRController = TextEditingController();
  final TextEditingController _RPDE_controller = TextEditingController();
  final TextEditingController _DFA_controller = TextEditingController();
  final TextEditingController _Spread1_controller = TextEditingController();
  final TextEditingController _Spread2_controller = TextEditingController();
  final TextEditingController _D2_controller = TextEditingController();
  final TextEditingController _PPE_controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            ChooseDiseaseAppBar.appBar(context, AppStrings.parkinsonPrediction),
        body: BuildBodyContent());
  }

  Widget BuildBodyContent() {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _MDVPHzController,
                hintTxt: AppStrings.parkinsonPrediction1,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _MDVP_percent_Controller,
                hintTxt: AppStrings.parkinsonPrediction2,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _MDVP_AbsController,
                hintTxt: AppStrings.parkinsonPrediction3,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _MDVPController,
                hintTxt: AppStrings.parkinsonPrediction4,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _JitterController,
                hintTxt: AppStrings.parkinsonPredictio5,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _ShimmerController,
                hintTxt: AppStrings.parkinsonPredictio6,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _NHRController,
                hintTxt: AppStrings.parkinsonPredictio7,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _RPDE_controller,
                hintTxt: AppStrings.parkinsonPredictio8,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _DFA_controller,
                hintTxt: AppStrings.parkinsonPredictio9,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFieldLikeCard(
                controller: _Spread1_controller,
                hintTxt: AppStrings.parkinsonPredictio10,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFieldLikeCard(
                controller: _Spread2_controller,
                hintTxt: AppStrings.parkinsonPredictio11,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFieldLikeCard(
                controller: _D2_controller,
                hintTxt: AppStrings.parkinsonPredictio12,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFieldLikeCard(
                controller: _PPE_controller,
                hintTxt: AppStrings.parkinsonPredictio13,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: AppButton(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      print("result");
                    }
                   
                  },
                  title: AppStrings.parkinsonPredictioresult,
                  titleColor: AppColors.white,
                  color: AppColors.primarycolor,
                  radius: 5,
                  fontFamily: FontConstants.neoSansArabicRegular,
                  fontSize: 15.sp,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
