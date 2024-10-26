import 'package:flutter/material.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/exam_details_view_body.dart';

class ExamDetailsView extends StatelessWidget {
  const ExamDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ExamDetailsViewBody(),
      ),
    );
  }
}
