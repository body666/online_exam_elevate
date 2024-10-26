import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FailurePlaceHolder extends StatelessWidget {
  final String message;
  const FailurePlaceHolder({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Center(
        child: Text(
          message,
        ),
      ),
    );
  }
}
