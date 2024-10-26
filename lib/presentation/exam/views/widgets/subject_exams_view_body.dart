import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam_elevate/presentation/exam/view_model/subject_exams/subject_exams_view_model.dart';

import 'exams_list_view_bloc_builder.dart';

class SubjectExamsViewBody extends StatefulWidget {
  const SubjectExamsViewBody({super.key});

  @override
  State<SubjectExamsViewBody> createState() => _SubjectExamsViewBodyState();
}

class _SubjectExamsViewBodyState extends State<SubjectExamsViewBody> {
  late final SubjectExamsViewModel subjectExamsViewModel;
  @override
  void initState() {
    subjectExamsViewModel = GetIt.instance.get<SubjectExamsViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          subjectExamsViewModel..fetchSubjectExams('670037f6728c92b7fdf434fc'),
      child: const Column(
        children: [
          CustomAppBar(
            title: 'Exams',
          ),
          ExamsListViewBlocBuilder(),
        ],
      ),
    );
  }
}
