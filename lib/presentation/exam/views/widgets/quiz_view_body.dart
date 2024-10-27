import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/domain/entities/exam.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/answers_section.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/questions_slider_section.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/quiz_timer_section.dart';

class QuizViewBody extends StatelessWidget {
  final Exam exam;
  const QuizViewBody({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: 13.h,
      ),
      child: Column(
        children: [
          QuizTimerSection(
            examTitle: exam.title.toString(),
            duration: exam.duration ?? 5,
          ),
          SizedBox(
            height: 8.h,
          ),
          QuestionsSliderSection(
            numberOfQuestions: exam.numberOfQuestions!,
            currentQuestion: 16,
          ),
          SizedBox(
            height: 24.h,
          ),
          const AnswersSection(),
        ],
      ),
    );
  }
}
