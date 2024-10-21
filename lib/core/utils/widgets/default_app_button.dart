import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../text_styles.dart';

class DefaultAppButton extends StatelessWidget {
  const DefaultAppButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 24.w,
          ),
          backgroundColor: AppColors.blueBaseColor,
          disabledBackgroundColor: AppColors.black30Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.style16.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
