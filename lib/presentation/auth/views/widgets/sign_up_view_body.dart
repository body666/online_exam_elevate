import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_text_field.dart';
import 'package:online_exam_elevate/core/utils/widgets/default_app_button.dart';
import 'package:online_exam_elevate/data/models/request/register_request.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/sign_up/sign_up_state.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/sign_up/sign_up_view_model.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/login_view_body.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/redirect_text_action.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/dialoges.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final _signUpViewModel = GetIt.instance.get<SignUpViewModel>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _signUpViewModel,
        child: BlocListener<SignUpViewModel, SignUpState>(
            listener: (context, state) {
          if (state is SignUpLoading) {
            showLoadingIndicator(context);
          } else if (state is SignUpSuccess) {
            popIfCan(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginViewBody(),
              ),
            );
          } else if (state is SignUpError) {
            debugPrint('SignUp error');
            popIfCan(context);
            final message = extractErrorMessage(
                state.exception ?? Exception("Unknown error"));
            showErrorDialog(context: context, message: message);
          }
        }, child: BlocBuilder<SignUpViewModel, SignUpState>(
                builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomAppBar(
                    title: 'Sign up',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    width: 0,
                    labelText: "User name",
                    hintText: "Enter your user name",
                    obsecureText: false,
                    controller: usernameController,
                    cursorColor: AppColors.blackBaseColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your user name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        width: 0,
                        labelText: "First name",
                        hintText: "Enter first name",
                        obsecureText: false,
                        controller: firstNameController,
                        cursorColor: AppColors.blackBaseColor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " enter first name";
                          }
                          return null;
                        },
                      )),
                      SizedBox(width: 16.w),
                      Expanded(
                          child: CustomTextField(
                        width: 0,
                        labelText: "Last name",
                        hintText: "Enter last name",
                        obsecureText: false,
                        controller: lastNameController,
                        cursorColor: AppColors.blackBaseColor,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " enter last name";
                          }
                          return null;
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    width: 0,
                    labelText: "Email",
                    hintText: "Enter your email",
                    obsecureText: false,
                    controller: emailController,
                    cursorColor: AppColors.blackBaseColor,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        width: 0,
                        labelText: "Password",
                        hintText: "Enter password",
                        controller: passwordController,
                        cursorColor: AppColors.blackBaseColor,
                        obsecureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          final bool passwordValid = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value);
                          if (!passwordValid) {
                            return "Password must be at least 8 characters long and include an uppercase letter, a number, and a special character.";
                          }
                          return null;
                        },
                      )),
                      SizedBox(width: 16.w),
                      Expanded(
                          child: CustomTextField(
                        width: 0,
                        labelText: "Confirm password",
                        hintText: "Confirm password",
                        obsecureText: true,
                        controller: confirmPasswordController,
                        cursorColor: AppColors.blackBaseColor,
                        validator: (value) {
                          if (passwordController.text != value) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    width: 0,
                    labelText: "Phone Number",
                    hintText: "Enter your phone Number",
                    obsecureText: false,
                    controller: phoneNumberController,
                    cursorColor: AppColors.blackBaseColor,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your phone number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.h),
                  DefaultAppButton(
                    text: "Sign up",
                    onPressed: () async {
                      sign();
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ActionText(
                    mainText: "Already have an account?",
                    actionText: "Login",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        })));
  }

  void sign() {
    if (_formKey.currentState!.validate()) {
      RegisterRequest registerRequest = RegisterRequest(
        email: emailController.text,
        password: passwordController.text,
        lastName: lastNameController.text,
        firstName: firstNameController.text,
        username: usernameController.text,
        rePassword: confirmPasswordController.text,
        phone: phoneNumberController.text,
      );
      _signUpViewModel.signUp(registerRequest);
    }
  }
}
