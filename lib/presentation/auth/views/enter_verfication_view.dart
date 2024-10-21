import 'package:flutter/material.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/forget_pass/enter_verfication_view_body.dart';

class EnterVerificationView extends StatelessWidget {
  const EnterVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EnterVerificationViewBody(),
      ),
    );
  }
}
