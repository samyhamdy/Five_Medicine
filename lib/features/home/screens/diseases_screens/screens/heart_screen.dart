// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/components/app_button.dart';
import '../../../../../core/components/text_form_field.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_fonts.dart';
import '../../../../../core/resources/app_strings.dart';
import '../../choose_disease/widgets/appbar.dart';

class HeartScreen extends StatefulWidget {
  const HeartScreen({super.key});

  @override
  State<HeartScreen> createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _chestPainTypesController =
      TextEditingController();
  final TextEditingController _restingBloodPressureController =
      TextEditingController();
  final TextEditingController _serumCholestoralinmgdlController =
      TextEditingController();
  final TextEditingController _fastingBloodSuger120mgdlController =
      TextEditingController();
  final TextEditingController _restingelectrocardiographicresults =
      TextEditingController();
  final TextEditingController _maximumheartrateachieved =
      TextEditingController();
  final TextEditingController _exerciseinducedangina = TextEditingController();
  final TextEditingController _stdepressionInducedbyExercise =
      TextEditingController();
  final TextEditingController _slopeofThePeakExerciseSTSement =
      TextEditingController();
  final TextEditingController _majorVesselsColoredbyFlourosopy =
      TextEditingController();
  final TextEditingController _zero_normal_one_fixeddefect2reversabledefect =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ChooseDiseaseAppBar.appBar(context, AppStrings.heartPrediction),
        body: buildBodyContent());
  }

  Widget buildBodyContent() {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              //age
              CustomTextFieldLikeCard(
                controller: _ageController,
                hintTxt: AppStrings.heartPrediction1,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              //sex
              CustomTextFieldLikeCard(
                controller: _sexController,
                hintTxt: AppStrings.heartPrediction2,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              //chest pain
              CustomTextFieldLikeCard(
                controller: _chestPainTypesController,
                hintTxt: AppStrings.heartPrediction3,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              //resting
              CustomTextFieldLikeCard(
                controller: _restingBloodPressureController,
                hintTxt: AppStrings.heartPrediction4,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              //serum
              CustomTextFieldLikeCard(
                controller: _serumCholestoralinmgdlController,
                hintTxt: AppStrings.heartPredictio5,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              //fasting
              CustomTextFieldLikeCard(
                controller: _fastingBloodSuger120mgdlController,
                hintTxt: AppStrings.heartPredictio6,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              //resting
              CustomTextFieldLikeCard(
                controller: _restingelectrocardiographicresults,
                hintTxt: AppStrings.heartPredictio7,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              //max heart
              CustomTextFieldLikeCard(
                controller: _maximumheartrateachieved,
                hintTxt: AppStrings.heartPredictio8,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              //exercise
              CustomTextFieldLikeCard(
                controller: _exerciseinducedangina,
                hintTxt: AppStrings.heartPredictio9,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              //std depre
              CustomTextFieldLikeCard(
                controller: _stdepressionInducedbyExercise,
                hintTxt: AppStrings.heartPredictio10,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              //slope
              CustomTextFieldLikeCard(
                controller: _majorVesselsColoredbyFlourosopy,
                hintTxt: AppStrings.heartPredictio11,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),

              //normal
              CustomTextFieldLikeCard(
                controller: _slopeofThePeakExerciseSTSement,
                hintTxt: AppStrings.heartPredictio12,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomTextFieldLikeCard(
                controller: _zero_normal_one_fixeddefect2reversabledefect,
                hintTxt: AppStrings.heartPredictio13,
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
                  title: AppStrings.heartPredictioresult,
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
