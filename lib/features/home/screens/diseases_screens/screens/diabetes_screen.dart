import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sizer/sizer.dart';

import '../../../../../core/components/app_button.dart';
import '../../../../../core/components/app_text.dart';
import '../../../../../core/components/text_form_field.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/app_fonts.dart';
import '../../../../../core/resources/app_strings.dart';
import '../../choose_disease/widgets/appbar.dart';

class DiabetesScreen extends StatefulWidget {
  const DiabetesScreen({super.key});

  @override
  State<DiabetesScreen> createState() => _DiabetesScreenState();
}

class _DiabetesScreenState extends State<DiabetesScreen> {
  final TextEditingController _numberofPregnanciesController =
      TextEditingController();
  final TextEditingController _glucoseLevelController = TextEditingController();
  final TextEditingController _bloodPressureValueController =
      TextEditingController();
  final TextEditingController _skinThickness1ValueController =
      TextEditingController();
  final TextEditingController _skinThickness2ValueController =
      TextEditingController();
  final TextEditingController _insulinLevelController = TextEditingController();
  final TextEditingController _bMIValueController = TextEditingController();
  final TextEditingController _diabetesPedigreeFunction =
      TextEditingController();
  final TextEditingController _ageoftheperson = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            ChooseDiseaseAppBar.appBar(context, AppStrings.diabetesPrediction),
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
              CustomTextFieldLikeCard(
                controller: _numberofPregnanciesController,
                hintTxt: AppStrings.diabetesPrediction1,
                type: TextInputType.text,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _glucoseLevelController,
                hintTxt: AppStrings.diabetesPrediction2,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _bloodPressureValueController,
                hintTxt: AppStrings.diabetesPrediction3,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _skinThickness1ValueController,
                hintTxt: AppStrings.diabetesPrediction4,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _skinThickness2ValueController,
                hintTxt: AppStrings.diabetesPrediction5,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _insulinLevelController,
                hintTxt: AppStrings.diabetesPrediction6,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _bMIValueController,
                hintTxt: AppStrings.diabetesPrediction6,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _diabetesPedigreeFunction,
                hintTxt: AppStrings.diabetesPrediction7,
                type: TextInputType.number,
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextFieldLikeCard(
                controller: _ageoftheperson,
                hintTxt: AppStrings.diabetesPrediction8,
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
                    // const ChooseDiseaseScreen().Push(
                    //     context: context,
                    //     type: PageTransitionType.bottomToTop);
                  },
                  title: AppStrings.diabetesresult,
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
