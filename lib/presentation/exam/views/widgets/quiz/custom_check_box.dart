import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.h,
      height: 24.h,
      child: Checkbox.adaptive(
        activeColor: AppColors.blueBaseColor,
        checkColor: AppColors.whiteColor,
        side: BorderSide(
          color: AppColors.blueBaseColor,
          width: 2.w,
        ),
        value: false,
        onChanged: (newValue) {},
      ),
    );
  }
}
