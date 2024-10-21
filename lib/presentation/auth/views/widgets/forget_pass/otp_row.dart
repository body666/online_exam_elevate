import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/forget_pass/otp_squar.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../view_model/verify_code/verify_code_state.dart';
import '../../../view_model/verify_code/verify_code_view_model.dart';

class OtpRow extends StatefulWidget {
  const OtpRow({super.key});

  @override
  State<OtpRow> createState() => _OtpRowState();
}

class _OtpRowState extends State<OtpRow> {
  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();

    _controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyCodeViewModel, VerifyCodeState>(
      buildWhen: (previous, current) {
        if (current is VerifyCodeLoading ||
            current is ResendVerifyCodeLoading) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        final verifyCodeViewModel = VerifyCodeViewModel.of(context);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: List.generate(
                6,
                (index) => Padding(
                  padding: index == 5
                      ? const EdgeInsets.all(0)
                      : EdgeInsets.only(
                          right: 10.w,
                        ),
                  child: OtpSquare(
                    hasError: verifyCodeViewModel.hasError,
                    controller: _controllers[index],
                    onChanged: (value) {
                      _handleFields(
                        context: context,
                        index: index,
                        value: value,
                        viewModel: verifyCodeViewModel,
                      );
                    },
                  ),
                ),
              ),
            ),
            if (verifyCodeViewModel.hasError)
              SizedBox(
                height: 6.h,
              ),
            if (verifyCodeViewModel.hasError)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 16.h,
                    color: AppColors.errorColor,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    'Invalid code',
                    style: AppTextStyles.style13.copyWith(
                      color: AppColors.errorColor,
                    ),
                  )
                ],
              ),
          ],
        );
      },
    );
  }

  void _handleFields({
    required int index,
    required BuildContext context,
    required String value,
    required VerifyCodeViewModel viewModel,
  }) {
    if (value.trim().isNotEmpty) {
      if (index == 5) {
        if (_checkIfFieldsEmpty()) {
          return;
        }
        _verify(viewModel);
        return;
      }
      FocusScope.of(context).nextFocus();
    }
  }

  bool _checkIfFieldsEmpty() {
    for (final controller in _controllers) {
      if (controller.text.isEmpty) {
        return true;
      }
    }
    return false;
  }

  void _verify(VerifyCodeViewModel viewModel) async {
    FocusScope.of(context).unfocus();
    final code = _extractCode();
    await viewModel.verify(code);
    _emptyFields();
  }

  String _extractCode() {
    String code = '';
    for (final controller in _controllers) {
      code = '$code${controller.text.trim()}';
    }
    debugPrint(
        '===============================================================$code');
    return code;
  }

  void _emptyFields() {
    for (final controller in _controllers) {
      controller.text = '';
    }
  }
}
