import 'package:flutter/material.dart';

import 'widgets/subject_exams/subject_exams_view_body.dart';

class SubjectExamsView extends StatelessWidget {
  const SubjectExamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SubjectExamsViewBody(),
      ),
    );
  }
}
