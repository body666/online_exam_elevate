import 'package:flutter/material.dart';
import 'package:online_exam_elevate/domain/entities/exam.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/quiz/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  final Exam exam;
  const QuizView({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: QuizViewBody(
          exam: exam,
        ),
      ),
    );
  }
}
