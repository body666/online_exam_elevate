import 'package:flutter/material.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/exam_details_view_body.dart';

import '../../../domain/entities/exam.dart';

class ExamDetailsView extends StatelessWidget {
  final Exam exam;
  const ExamDetailsView({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExamDetailsViewBody(
          exam: exam,
        ),
      ),
    );
  }
}
