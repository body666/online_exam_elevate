import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 8.h,
          left: 16.w,
          right: 6.w,
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.blackBaseColor,
          size: 20.h,
        ),
      ),
    );
  }
}
