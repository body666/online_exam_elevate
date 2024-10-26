import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/exam_item.dart';

class SubjectExamsViewBody extends StatelessWidget {
  const SubjectExamsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
            top: 8.h,
          ),
          child: const CustomAppBar(title: 'Exams'),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            itemCount: 5,
            itemBuilder: (_, index) => const ExamItem(),
            separatorBuilder: (_, index) => SizedBox(
              height: 16.h,
            ),
          ),
        ),
      ],
    );
  }
}
