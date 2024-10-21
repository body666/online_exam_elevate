import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/custom_app_bar.dart';
import 'otp_section.dart';
import 'page_title_subtitle_column.dart';

class EnterVerificationViewBody extends StatelessWidget {
  const EnterVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Password',
          ),
          SizedBox(
            height: 38.h,
          ),
          const PageTitleSubtitleColumn(
            title: 'Email verification',
            subTitle:
                'Please enter your code that has been sent\n to your email address',
          ),
          SizedBox(
            height: 30.h,
          ),
          const OtpSection(),
        ],
      ),
    );
  }
}
