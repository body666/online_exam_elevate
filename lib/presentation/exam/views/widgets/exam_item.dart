import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/colors.dart';
import 'package:online_exam_elevate/core/utils/text_styles.dart';
import 'package:online_exam_elevate/domain/entities/exam.dart';
import 'package:online_exam_elevate/presentation/exam/views/exam_details_view.dart';

import '../../../../core/utils/assets.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key, required this.exam});
  final Exam exam;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ExamDetailsView(
              exam: exam,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff2A2929).withOpacity(0.25),
              blurRadius: 8,
            ),
          ],
        ),
        child: Material(
          color: AppColors.whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.examImage,
                width: 60.w,
                height: 71.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title.toString(),
                    style: AppTextStyles.style16,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    '${exam.numberOfQuestions} Question',
                    style: AppTextStyles.style13.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'From: 1 To: 6',
                    style: AppTextStyles.style13,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${exam.duration} Minutes',
                style: AppTextStyles.style13.copyWith(
                  color: AppColors.blueBaseColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
