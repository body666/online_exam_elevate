import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/text_styles.dart';

import '../../../../../core/utils/colors.dart';
import 'custom_check_box.dart';
import 'custom_radio_button.dart';

class AnswerSelectionItem extends StatelessWidget {
  final bool isSingleChoice;
  final bool isChosen;
  const AnswerSelectionItem(
      {super.key, required this.isSingleChoice, required this.isChosen});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: isChosen ? AppColors.blue10Color : AppColors.lightBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 16.h,
          ),
          child: Row(
            children: [
              isSingleChoice
                  ? const CustomRadioButton()
                  : const CustomCheckBox(),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Its going to rain today.',
                style: AppTextStyles.style14,
              ),
            ],
          ),
        ));
  }
}
