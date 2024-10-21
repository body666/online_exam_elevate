import 'package:flutter/material.dart';

import 'widgets/forget_pass/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ForgetPasswordViewBody(),
      ),
    );
  }
}
