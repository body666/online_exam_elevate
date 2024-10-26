import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text_styles.dart';
import 'custom_back_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomBackButton(),
        SizedBox(
          width: 6.w,
        ),
        Text(
          title,
          style: AppTextStyles.style20,
        )
      ],
    );
  }
}
