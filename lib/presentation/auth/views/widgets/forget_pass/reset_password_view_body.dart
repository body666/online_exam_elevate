import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import 'page_title_subtitle_column.dart';
import 'reset_pass_section.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: 16.w,
      ),
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Password',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 38.h,
                ),
                const PageTitleSubtitleColumn(
                  title: 'Reset password',
                  subTitle:
                      'Password must not be empty and must\n contain 6 characters with upper case\n letter and one number at least ',
                ),
                SizedBox(
                  height: 28.h,
                ),
                const ResetPassSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
