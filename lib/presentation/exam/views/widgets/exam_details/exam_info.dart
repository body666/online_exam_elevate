import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';

class ExamInfo extends StatelessWidget {
  final String? title;
  final int? numberOfQuestions, duration;
  const ExamInfo({
    super.key,
    required this.title,
    required this.numberOfQuestions,
    required this.duration,
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
              'Assessment',
              style: AppTextStyles.style20w600,
            ),
            const Spacer(),
            Text(
              '$duration Minutes',
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
              title.toString(),
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
              '$numberOfQuestions Question',
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
