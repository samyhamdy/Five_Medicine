// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:os_project/core/components/app_text.dart';
import 'package:os_project/core/components/navig.dart';
import 'package:os_project/core/resources/app_assets.dart';
import 'package:os_project/core/resources/app_colors.dart';
import 'package:os_project/core/resources/app_fonts.dart';
import 'package:os_project/core/resources/app_strings.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/app_button.dart';
import '../../../core/components/text_form_field.dart';
import '../../../core/utils/locator_utils.dart';
import '../../../core/validations/validations.dart';
import '../../home/screens/choose_disease/screens/choose_disease.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGender;
  File? profileImage;
  File? profileUidImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppText(
            AppStrings.profile1,
            color: AppColors.primarycolor,
            fontSize: 18.sp,
            fontFamily: FontConstants.neoSansArabicRegular,
            fontWeight: FontWeightManager.bold,
          ),
        ),
        body: _buildbodycontent());
  }

  Widget _buildbodycontent() {
    return WillPopScope(
      onWillPop: () async {
        await _onBackPressed(context);
        return false;
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Align(alignment: Alignment.center, child: _getprofileImage()),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFieldLikeCard(
                  controller: _fullnameController,
                  hintTxt: AppStrings.profile2,
                  type: TextInputType.name,
                  validation: (name) => AppValidations.nameValidation(name!),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFieldLikeCard(
                  controller: _nicknameController,
                  hintTxt: AppStrings.profile3,
                  type: TextInputType.name,
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFieldLikeCard(
                  controller: _emailController,
                  hintTxt: AppStrings.profile4,
                  type: TextInputType.emailAddress,
                  validation: (email) => AppValidations.emailValidation(email!),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFieldLikeCard(
                  controller: _phoneController,
                  hintTxt: AppStrings.profile5,
                  type: TextInputType.phone,
                  validation: (phone) => AppValidations.phoneValidation(phone!),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                    width: 90.w,
                    child: Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                        side: BorderSide(
                          color: AppColors.borderColor,
                          width: .2, // set the width for the border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2.w),
                        child: DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.hintcolor,
                          ),
                          style: TextStyle(color: AppColors.hintcolor),
                          underline: Container(),
                          value: selectedGender,
                          hint: selectedGender == null
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      AppStrings.profile6,
                                      style: TextStyle(
                                          color: AppColors.hintcolor,
                                          fontFamily: FontConstants
                                              .neoSansArabicRegular,
                                          fontSize: 13.sp),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      '$selectedGender',
                                      style: TextStyle(
                                          color: AppColors.hintcolor,
                                          fontFamily: FontConstants
                                              .neoSansArabicRegular,
                                          fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                          onChanged: (value) {
                            setState(() {});
                            selectedGender = value!;
                          },
                          items: [
                            DropdownMenuItem(
                              value: 'male',
                              child: Text(
                                'Male',
                                style: TextStyle(
                                    color: AppColors.hintcolor,
                                    fontFamily:
                                        FontConstants.neoSansArabicRegular,
                                    fontSize: 13.sp),
                              ),
                            ),
                            DropdownMenuItem(
                              value: AppStrings.female,
                              child: Text(AppStrings.female,
                                  style: TextStyle(
                                      color: AppColors.hintcolor,
                                      fontFamily:
                                          FontConstants.neoSansArabicRegular,
                                      fontSize: 13.sp)),
                            ),
                          ],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextFieldLikeCard(
                  controller: _ageController,
                  hintTxt: AppStrings.profile7,
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
                        LocatorUtils().pref().isAuthenticated =
                            true;
                        const ChooseDiseaseScreen().PushAndReplace(
                            context: context,
                            type: PageTransitionType.bottomToTop);
                      }
                    },
                    title: AppStrings.profile8,
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
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppStrings.select),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Row(
                          children: [
                            Icon(
                              Icons.photo_camera_rounded,
                              color: AppColors.primarycolor,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            AppText(AppStrings.camera),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          _getImageFromCamera();
                        },
                      ),
                      GestureDetector(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.image,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            AppText(AppStrings.gallery),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                          _getImageFromGallery();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(AppStrings.cancel))
                ],
              ),
            ),
          );
        });
  }

  _editIcon() {
    return Transform.translate(
      offset: Offset(18.w, 17.5.w),
      child: Container(
        height: 3.5.h,
        width: 7.5.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          color: AppColors.primarycolor,
        ),
        child: Center(
            child: Image.asset(
          AppAssets.edit,
          color: AppColors.white,
        )),
      ),
    );
  }

  _getprofileImage() {
    return SizedBox(
      width: 23.w,
      height: 23.w,
      child: InkWell(
          child: Center(
              child: profileImage != null
                  ? Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100000),
                            child: Image.file(
                              profileImage!,
                              width: 23.w,
                              height: 23.w,
                              fit: BoxFit.fill,
                            )),
                        _editIcon()
                      ],
                    )
                  : Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            AppAssets.defaultprofileimage,
                            width: .23.w * 100,
                            height: .23.w * 100,
                          ),
                        ),
                        _editIcon(),
                      ],
                    )),
          onTap: () {
            _showDialog();
          }),
    );
  }

  _getImageFromCamera() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path); //here is the image
      } else {
        print('No image selected.');
      }
    });
  }

  _getImageFromGallery() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path); //image from gallery
      } else {
        print('No image selected.');
      }
    });
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
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.primarycolor),
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
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.primarycolor),
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
