import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_styles.dart';

class ActionText extends StatelessWidget {
  const ActionText({
    super.key,
    required this.mainText,
    required this.actionText,
    this.onTap,
    this.actionTextWeight,
  });

  final String mainText;
  final String actionText;
  final void Function()? onTap;
  final FontWeight? actionTextWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$mainText ',
          style: AppTextStyles.style16W400,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.blueBaseColor,
                  width: 1.5,
                ),
              ),
            ),
            child: Text(
              actionText,
              style: AppTextStyles.style16W400.copyWith(
                  color: AppColors.blueBaseColor, fontWeight: actionTextWeight),
            ),
          ),
        ),
      ],
    );
  }
}
