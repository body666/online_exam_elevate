import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/text_styles.dart';
import 'package:online_exam_elevate/presentation/exam/views/widgets/answer_selection_item.dart';

import 'quiz_buttons_row.dart';
import 'time_out_dialog.dart';

class AnswersSection extends StatelessWidget {
  const AnswersSection({super.key});

  @override
  Widget build(BuildContext context) {
    const List<bool> isChosen = [
      true,
      false,
      false,
      false,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select the correctly punctuated sentence.',
            style: AppTextStyles.style18,
          ),
          SizedBox(
            height: 8.h,
          ),
          ...List.generate(
            4,
            (index) => Padding(
              padding: EdgeInsets.only(
                top: 16.h,
              ),
              child: AnswerSelectionItem(
                isSingleChoice: true,
                isChosen: isChosen[index],
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          QuizButtonsRow(
            onBackPressed: () {},
            onNextPressed: () {
              showDialog(
                context: context,
                builder: (_) => const TimeOutDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
