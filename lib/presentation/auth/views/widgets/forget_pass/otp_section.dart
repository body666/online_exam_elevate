import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/dialoges.dart';
import 'package:online_exam_elevate/core/utils/helper_functions.dart';
import 'package:online_exam_elevate/core/utils/snackbars.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/verify_code/verify_code_view_model.dart';
import 'package:online_exam_elevate/presentation/auth/views/reset_password_view.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/services/cache_service.dart';
import '../../../view_model/verify_code/verify_code_state.dart';
import '../redirect_text_action.dart';
import 'otp_row.dart';

class OtpSection extends StatefulWidget {
  const OtpSection({super.key});

  @override
  State<OtpSection> createState() => _OtpSectionState();
}

class _OtpSectionState extends State<OtpSection> {
  final _verifyCodeViewModel = GetIt.instance.get<VerifyCodeViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _verifyCodeViewModel,
      child: BlocListener<VerifyCodeViewModel, VerifyCodeState>(
        listener: (context, state) {
          if (state is VerifyCodeLoading || state is ResendVerifyCodeLoading) {
            showLoadingIndicator(context);
          }
          if (state is VerifyCodeSuccess) {
            popIfCan(context);
            debugPrint('code has been verified');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ResetPasswordView(),
              ),
            );
          }

          if (state is VerifyCodeFailure) {
            popIfCan(context);
          }
          if (state is ResendVerifyCodeFailure) {
            handleFailureState(context, state.exception);
          }
          if (state is ResendVerifyCodeSuccess) {
            popIfCan(context);
            ScaffoldMessenger.of(context).showSnackBar(
              buildSuccessSnackBar(
                'An OTP has been sent to your email',
              ),
            );
          }
        },
        child: Column(
          children: [
            const OtpRow(),
            SizedBox(
              height: 24.h,
            ),
            ActionText(
              mainText: 'Didn\'t receive code?',
              actionText: 'Resend',
              actionTextWeight: FontWeight.w400,
              onTap: resendCode,
            ),
          ],
        ),
      ),
    );
  }

  void resendCode() {
    FocusScope.of(context).unfocus();
    final cacheService = GetIt.instance.get<CacheService>();
    _verifyCodeViewModel.resendCode(
      cacheService.getData(
        key: AppConstants.resetPassEmailKey,
      ),
    );
  }
}
