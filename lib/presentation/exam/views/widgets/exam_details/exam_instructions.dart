import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';

class ExamInstructions extends StatelessWidget {
  const ExamInstructions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions',
          style: AppTextStyles.style18,
        ),
        SizedBox(
          height: 16.h,
        ),
        ...List.generate(
          4,
          (index) => Text(
            'Lorem ipsum dolor sit amet consectetur.',
            style: AppTextStyles.style14.copyWith(
              color: AppColors.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
