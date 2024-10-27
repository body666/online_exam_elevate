import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/utils/assets.dart';
import 'package:online_exam_elevate/core/utils/colors.dart';
import 'package:online_exam_elevate/core/utils/text_styles.dart';
import 'package:online_exam_elevate/core/utils/widgets/default_app_button.dart';

class TimeOutDialog extends StatelessWidget {
  const TimeOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      child: Container(
        padding: EdgeInsets.all(
          24.w,
        ),
        height: 230.h,
        width: 289.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.timeOutImage,
                  height: 86.h,
                  width: 45.w,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'Time out !!',
                  style: AppTextStyles.style24,
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
              width: 191.w,
              height: 45.h,
              child: DefaultAppButton(
                text: 'View score',
                textStyle: AppTextStyles.style14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
