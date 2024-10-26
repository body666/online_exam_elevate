import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_styles.dart';

class ExamInfo extends StatelessWidget {
  const ExamInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              AppAssets.examImage,
              width: 42.w,
              height: 47.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              'Languages',
              style: AppTextStyles.style20w600,
            ),
            const Spacer(),
            Text(
              '30 Minutes',
              style: AppTextStyles.style13.copyWith(
                color: AppColors.blueBaseColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Text(
              'High level',
              style: AppTextStyles.style16,
            ),
            SizedBox(
              width: 8.w,
            ),
            Container(
              color: AppColors.blue30Color,
              width: 1.w,
              height: 20.h,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              '20 Question',
              style: AppTextStyles.style13.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
