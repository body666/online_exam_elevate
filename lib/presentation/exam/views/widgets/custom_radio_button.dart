import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.h,
      height: 24.h,
      child: Radio.adaptive(
        activeColor: AppColors.blueBaseColor,
        fillColor: const WidgetStatePropertyAll(AppColors.blueBaseColor),
        value: 1,
        groupValue: 1,
        onChanged: (newValue) {},
      ),
    );
  }
}
