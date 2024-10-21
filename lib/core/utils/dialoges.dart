import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/colors.dart';
import 'package:online_exam_elevate/core/utils/helper_functions.dart';
import 'package:online_exam_elevate/core/utils/text_styles.dart';

showLoadingIndicator(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => SizedBox(
      height: 100.h,
      child: const AlertDialog(
        content: LinearProgressIndicator(
          color: AppColors.blueBaseColor,
        ),
      ),
    ),
  );
}

showErrorDialog({required BuildContext context, required String message}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: AppColors.fillColor,
      actionsPadding: EdgeInsets.only(
        bottom: 16.h,
        right: 16.w,
        left: 16.w,
      ),
      content: Text(
        message,
        style: AppTextStyles.style16W400,
        softWrap: true,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        TextButton(
            onPressed: () {
              popIfCan(context);
            },
            child: Text(
              'Ok',
              style: AppTextStyles.style16.copyWith(
                color: AppColors.blueBaseColor,
              ),
            ))
      ],
    ),
  );
}
