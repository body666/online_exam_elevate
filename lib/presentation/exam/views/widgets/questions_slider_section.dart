import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_styles.dart';

class QuestionsSliderSection extends StatelessWidget {
  final int numberOfQuestions;
  final double currentQuestion;
  const QuestionsSliderSection({
    super.key,
    required this.numberOfQuestions,
    required this.currentQuestion,
  });

  @override
  Widget build(BuildContext context) {
    final percent = 20 / numberOfQuestions;
    debugPrint(percent.toString());
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Column(
        children: [
          Text(
            'Question 1 of $numberOfQuestions',
            style: AppTextStyles.style13.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          LinearPercentIndicator(
            animation: true,
            percent: currentQuestion / numberOfQuestions,
            animateFromLastPercent: true,
            backgroundColor: AppColors.black10Color,
            progressColor: AppColors.blueBaseColor,
          ),
        ],
      ),
    );
  }
}
