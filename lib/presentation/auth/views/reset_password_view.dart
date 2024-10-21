import 'package:flutter/material.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/forget_pass/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ResetPasswordViewBody(),
      ),
    );
  }
}
