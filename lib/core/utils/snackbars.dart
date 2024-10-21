import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/colors.dart';
import 'package:online_exam_elevate/core/utils/text_styles.dart';

SnackBar buildSuccessSnackBar(String message) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(
      horizontal: 16.w,
      vertical: 32.h,
    ),
    backgroundColor: AppColors.fillColor,
    content: Row(
      children: [
        const Icon(
          Icons.check,
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Text(
            message,
            style: AppTextStyles.style16W400,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        12.r,
      ),
    ),
  );
}
