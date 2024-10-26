import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_back_icon.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/widgets/default_app_button.dart';
import 'exam_info.dart';
import 'exam_instructions.dart';

class ExamDetailsViewBody extends StatelessWidget {
  const ExamDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
        top: 8.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(
            height: 22.h,
          ),
          const ExamInfo(),
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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
