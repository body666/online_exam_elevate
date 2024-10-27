import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class QuizTimerSection extends StatelessWidget {
  final String examTitle;
  final int duration;
  const QuizTimerSection(
      {super.key, required this.examTitle, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomAppBar(
          title: examTitle,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 16.w,
            top: 5.h,
          ),
          child: Row(
            children: [
              Image.asset(
                AppAssets.timerImage,
                height: 30.h,
                width: 24.w,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              SizedBox(
                width: 6.w,
              ),
              Text(
                duration.toStringAsFixed(2),
                style: AppTextStyles.style20.copyWith(
                  color: AppColors.successColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
