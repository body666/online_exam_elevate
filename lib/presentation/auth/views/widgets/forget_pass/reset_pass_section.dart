import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/app_constants.dart';
import 'package:online_exam_elevate/core/utils/dialoges.dart';
import 'package:online_exam_elevate/core/utils/helper_functions.dart';
import 'package:online_exam_elevate/core/utils/services/cache_service.dart';
import 'package:online_exam_elevate/core/utils/snackbars.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/reset_pass/reset_pass_state.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/reset_pass/reset_pass_view_model.dart';

import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../../core/utils/widgets/default_app_button.dart';

class ResetPassSection extends StatefulWidget {
  const ResetPassSection({
    super.key,
  });

  @override
  State<ResetPassSection> createState() => _ResetPassSectionState();
}

class _ResetPassSectionState extends State<ResetPassSection> {
  final _resetPassViewModel = GetIt.instance.get<ResetPassViewModel>();
  late final TextEditingController _newPassController;
  late final TextEditingController _confirmPassController;
  late final FocusNode _confirmPassFocusNode;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _newPassController = TextEditingController();
    _confirmPassController = TextEditingController();
    _confirmPassFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _newPassController.dispose();
    _confirmPassController.dispose();
    _confirmPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _resetPassViewModel,
      child: BlocListener<ResetPassViewModel, ResetPassState>(
        listener: (context, state) {
          if (state is ResetPassLoading) {
            showLoadingIndicator(context);
          }
          if (state is ResetPassSuccess) {
            popIfCan(context);
            ScaffoldMessenger.of(context).showSnackBar(
              buildSuccessSnackBar(
                'Your Password has been updated successfully',
              ),
            );
          }
          if (state is ResetPassFailure) {
            handleFailureState(context, state.exception);
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _newPassController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                width: double.infinity,
                validator: (value) {
                  return _resetPassViewModel.validateNewPass(value);
                },
                labelText: 'New password',
                hintText: 'Enter your password',
              ),
              SizedBox(
                height: 22.h,
              ),
              CustomTextField(
                controller: _confirmPassController,
                focusNode: _confirmPassFocusNode,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  _resetPass();
                },
                width: double.infinity,
                validator: (value) {
                  return _resetPassViewModel.validateConfirmPass(
                    value: value,
                    newPassValue: _newPassController.text,
                  );
                },
                labelText: 'Confirm password',
                hintText: 'Confirm password',
              ),
              SizedBox(
                height: 44.h,
              ),
              DefaultAppButton(
                text: 'Continue',
                onPressed: _resetPass,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _resetPass() async {
    if (_formKey.currentState!.validate()) {
      final email = GetIt.instance.get<CacheService>().getData(
            key: AppConstants.resetPassEmailKey,
          );
      debugPrint(email);
      await _resetPassViewModel.resetPass(
        email: email,
        newPassword: _newPassController.text,
      );
      _emptyFields();
    }
  }

  void _emptyFields() {
    _newPassController.text = "";
    _confirmPassController.text = "";
  }
}
