// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors, implementation_imports, prefer_interpolation_to_compose_strings
// ignore: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:intl/intl.dart' as intl;

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

// ignore: must_be_immutable
class CustomTextFieldLikeCard extends StatefulWidget {
  final Widget? Icon;
  final TextEditingController? controller;
  final String? hintTxt;
  final double? hintsize;
  final double? radius;
  final int? minliens;
  final bool? readonly;
  final bool? visible;
  final Widget? prefix;
  final TextInputType? type;
  final String? Function(String?)? validation;
  final Function(String?)? search;
  final Color? contentColor;
  final Color? outlineBorderColor;
  final double? borderThickness;
  final double? contentPaddingVertical;
  final double? contentPaddinghorizental;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  bool? isenabled = true;

  final TextInputAction? textInputAction;
  CustomTextFieldLikeCard(
      {Key? key,
      this.Icon,
      this.controller,
      required this.hintTxt,
      this.visible,
      this.width,
      this.height,
      this.contentColor,
      this.borderThickness,
      this.outlineBorderColor,
      this.hintsize,
      this.contentPaddingVertical,
      this.contentPaddinghorizental,
      this.minliens,
      this.search,
      this.textInputAction,
      this.isenabled,
      this.type,
      this.padding,
      this.readonly,
      this.radius,
      this.prefix,
      this.boxShadow,
      this.validation})
      : super(key: key);

  @override
  State<CustomTextFieldLikeCard> createState() =>
      _CustomTextFieldLikeCardState();
}

class _CustomTextFieldLikeCardState extends State<CustomTextFieldLikeCard> {
  String? lang;
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      //   Background:
      // hintColor: AppColors.hintcolor,
      padding: widget.padding ?? EdgeInsets.all(1.5.w),
      child: SizedBox(
        width: widget.width ?? .9.w * 100,
        child: Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 2),
            side: BorderSide(
              color: AppColors.borderColor,
              width: widget.borderThickness ?? .2,
            ),
          ),
          child: Center(
            child: TextFormField(
              enabled: widget.isenabled ?? true,
              showCursor: true,
              cursorHeight: 3.5.h,
              cursorColor: AppColors.white,
              controller: widget.controller,
              obscureText: widget.visible ?? false,
              minLines: widget.minliens ?? 1,
              maxLines: widget.minliens ?? 1,
              textDirection: text == null && lang == "ar"
                  ? TextDirection.rtl
                  : text == null && lang == "en"
                      ? TextDirection.ltr
                      : isRTL(text ?? "")
                          ? TextDirection.rtl
                          : TextDirection.ltr,
              keyboardType: widget.type ?? TextInputType.text,
              validator: widget.validation ??
                  (value) {
                    if (value!.isEmpty) {
                      return "this Field is required";
                    }
                    return null;
                  },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: widget.readonly ?? false,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              onFieldSubmitted: (txt) {
                if (widget.textInputAction == TextInputAction.search) {
                  widget.search!(txt);
                }
              },
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
              style: TextStyle(
                  fontFamily: FontConstants.neoSansArabicRegular,
                  fontSize: widget.hintsize ?? 13.sp,
                  color: widget.contentColor ?? AppColors.hintcolor),
              decoration: InputDecoration(
                  errorStyle: TextStyle(
                      fontFamily: FontConstants.neoSansArabicRegular,
                      fontSize: 10.sp,
                      color: Colors.red[900]),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: widget.contentPaddingVertical ?? 1.2.h,
                      horizontal: widget.contentPaddinghorizental ?? 8),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 30),
                    borderSide: BorderSide(
                        color: widget.outlineBorderColor ?? AppColors.white,
                        width: widget.borderThickness ?? .5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 30),
                    borderSide: BorderSide(
                      color: widget.outlineBorderColor ?? AppColors.white,
                      width: widget.borderThickness ?? .2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: .5,
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                    color: AppColors.hintcolor,
                    fontFamily: FontConstants.neoSansArabicRegular,
                    fontSize: widget.hintsize ?? 13.sp,
                  ),
                  hintText: "   " + widget.hintTxt.toString() + "   ",
                  fillColor: Colors.transparent,
                  suffixIcon: widget.Icon,
                  prefixIcon: widget.prefix),
            ),
          ),
        ),
      ),
    );
  }
}
