import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';

class PageTitleSubtitleColumn extends StatelessWidget {
  const PageTitleSubtitleColumn({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.style18,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          subTitle,
          style: AppTextStyles.style14.copyWith(
            color: AppColors.greyColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
