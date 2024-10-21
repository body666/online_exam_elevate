import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.width,
      required this.labelText,
      required this.hintText,
      this.validator,
      this.onSaved,
      this.autovalidateMode,
      this.textInputAction,
      this.onEditingComplete,
      this.controller,
      this.focusNode,
      this.keyboardType,
      this.onFieldSubmitted,
      this.obsecureText});

  final obsecureText;
  final double width;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        autovalidateMode: autovalidateMode,
        style: AppTextStyles.style16W400,
        onSaved: onSaved,
        validator: validator,
        obscureText: obsecureText,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
          alignLabelWithHint: true,
          label: Text(
            labelText,
          ),
          labelStyle: AppTextStyles.style12.copyWith(
            color: AppColors.greyColor,
          ),
          hintText: hintText,
          hintStyle: AppTextStyles.style14.copyWith(
            color: AppColors.placeHolderColor,
          ),
          errorStyle: AppTextStyles.style12.copyWith(
            color: AppColors.errorColor,
          ),
          border: _buildOutlineBorder(),
          enabledBorder: _buildOutlineBorder(),
          focusedBorder: _buildFocusedBorder(),
          errorBorder: _buildErrorBorder(),
          disabledBorder: _buildOutlineBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(
        color: AppColors.blackBaseColor,
        width: 1.sp,
      ),
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(
        color: AppColors.blackBaseColor,
        width: 2.sp,
      ),
    );
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(
        color: AppColors.errorColor,
        width: 1.sp,
      ),
      gapPadding: 30.h,
    );
  }
}
