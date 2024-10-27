import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_back_icon.dart';
import 'package:online_exam_elevate/domain/entities/exam.dart';
import 'package:online_exam_elevate/presentation/exam/views/quiz_view.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/widgets/default_app_button.dart';
import 'exam_info.dart';
import 'exam_instructions.dart';

class ExamDetailsViewBody extends StatelessWidget {
  final Exam exam;
  const ExamDetailsViewBody({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomBackButton(),
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 22.h,
              ),
              ExamInfo(
                duration: exam.duration,
                numberOfQuestions: exam.numberOfQuestions,
                title: exam.title,
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                color: AppColors.blue10Color,
                height: 0.5,
              ),
              SizedBox(
                height: 24.h,
              ),
              const ExamInstructions(),
              SizedBox(
                height: 48.h,
              ),
              DefaultAppButton(
                text: 'Start',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizView(
                        exam: exam,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
