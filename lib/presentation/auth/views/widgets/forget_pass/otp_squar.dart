import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/text_styles.dart';

import '../../../../../core/utils/colors.dart';

class OtpSquare extends StatelessWidget {
  const OtpSquare({
    super.key,
    required this.hasError,
    this.onChanged,
    this.controller,
    this.focusNode,
  });

  final bool hasError;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: hasError ? AppColors.whiteColor : const Color(0xffCCD7EB),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: hasError ? AppColors.errorColor : AppColors.whiteColor,
          width: 1.sp,
        ),
      ),
      height: 42.h,
      width: 45.w,
      child: Center(
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          onChanged: onChanged,
          style: AppTextStyles.style16W400,
          maxLength: 1,
          buildCounter: _buiCounter,
          cursorColor: AppColors.blueBaseColor,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 18.w,
              top: 4.h,
              bottom: 4.h,
            ),
            fillColor: AppColors.fillColor,
            filled: !hasError,
            border: _buildOutlineBorder(),
            enabledBorder: _buildOutlineBorder(),
            focusedBorder: _buildOutlineBorder(),
            errorBorder: _buildOutlineBorder(),
            disabledBorder: _buildOutlineBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
    );
  }

  Widget? _buiCounter(_,
      {currentLength = 0, isFocused = false, maxLength = 1}) {
    return null;
  }
}
