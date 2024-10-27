import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_styles.dart';

class QuizButtonsRow extends StatelessWidget {
  final void Function()? onBackPressed;
  final void Function()? onNextPressed;
  const QuizButtonsRow({
    super.key,
    this.onBackPressed,
    this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 48.h,
          width: MediaQuery.sizeOf(context).width * 0.39,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
              side: BorderSide(color: AppColors.blueBaseColor, width: 1.w),
            ),
            onPressed: onBackPressed,
            child: Text(
              'Back',
              style: AppTextStyles.style16.copyWith(
                color: AppColors.blueBaseColor,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        SizedBox(
          height: 48.h,
          width: MediaQuery.sizeOf(context).width * 0.39,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueBaseColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
            ),
            onPressed: onNextPressed,
            child: Text(
              'Next',
              style: AppTextStyles.style16.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
