import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/colors.dart';
import 'package:online_exam_elevate/core/utils/helper_functions.dart';

import '../../../../../core/utils/widgets/failure_place_holder.dart';
import '../../../view_model/subject_exams/subject_exams_view_model.dart';
import 'exam_item.dart';

class ExamsListViewBlocBuilder extends StatefulWidget {
  const ExamsListViewBlocBuilder({
    super.key,
  });

  @override
  State<ExamsListViewBlocBuilder> createState() =>
      _ExamsListViewBlocBuilderState();
}

class _ExamsListViewBlocBuilderState extends State<ExamsListViewBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectExamsViewModel, SubjectExamsState>(
      builder: (context, state) {
        if (state is FetchSubjectExamsFailure) {
          final errorMessage = extractErrorMessage(state.exception);
          return FailurePlaceHolder(
            message: errorMessage,
          );
        }
        if (state is FetchSubjectExamsSuccess) {
          return Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                left: 16.h,
                right: 16.h,
                bottom: 16.h,
                top: 37.h,
              ),
              itemCount: state.exams.length,
              itemBuilder: (_, index) => ExamItem(
                exam: state.exams[index],
              ),
              separatorBuilder: (_, index) => SizedBox(
                height: 16.h,
              ),
            ),
          );
        }
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.blueBaseColor,
            ),
          ),
        );
      },
    );
  }
}
