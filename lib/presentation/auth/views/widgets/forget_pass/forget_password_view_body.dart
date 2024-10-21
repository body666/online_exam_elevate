import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/dialoges.dart';
import 'package:online_exam_elevate/core/utils/helper_functions.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/forget_pass/forget_pass_state.dart';
import 'package:online_exam_elevate/presentation/auth/views/enter_verfication_view.dart';

import '../../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../../../core/utils/widgets/default_app_button.dart';
import '../../../view_model/forget_pass/forget_pass_view_model.dart';
import 'page_title_subtitle_column.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  static const String routeName = "ForgetPasswordViewBody";

  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _forgetPassViewModel = GetIt.instance.get<ForgetPassViewModel>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _forgetPassViewModel,
      child: BlocListener<ForgetPassViewModel, ForgetPassState>(
        listener: (context, state) {
          if (state is EmailSendingLoading) {
            showLoadingIndicator(context);
          } else if (state is EmailSentSuccess) {
            popIfCan(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EnterVerificationView(),
              ),
            );
          } else if (state is EmailSentFailure) {
            debugPrint('email error');
            popIfCan(context);
            final message = extractErrorMessage(state.exception!);
            showErrorDialog(context: context, message: message);
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 10.h,
          ),
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Password',
              ),
              SizedBox(
                height: 38.h,
              ),
              const PageTitleSubtitleColumn(
                title: 'ForgetPassword',
                subTitle:
                    'Please enter your email associated to\n your account',
              ),
              SizedBox(
                height: 30.h,
              ),
              Form(
                key: _formKey,
                child: BlocBuilder<ForgetPassViewModel, ForgetPassState>(
                  builder: (context, state) {
                    return CustomTextField(
                      onEditingComplete: submit,
                      autovalidateMode: _forgetPassViewModel.autovalidateMode,
                      width: double.infinity,
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          _forgetPassViewModel.activateValidationMode();
                          return 'Please enter a valid email';
                        }
                        if (!RegExp(r'@').hasMatch(value)) {
                          _forgetPassViewModel.activateValidationMode();
                          return 'This email is not valid';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _forgetPassViewModel.saveEmail(value!);
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              DefaultAppButton(
                text: 'Continue',
                onPressed: () {
                  submit();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      _forgetPassViewModel.forgetPass(_forgetPassViewModel.email);
    }
  }
}
