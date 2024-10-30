import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/colors.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_text_field.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/login/login_state.dart';
import 'package:online_exam_elevate/presentation/auth/view_model/login/login_view_model.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/redirect_text_action.dart';

import '../../../../core/utils/dialoges.dart';
import '../../../../core/utils/helper_functions.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../core/utils/widgets/default_app_button.dart';
import '../forget_password_view.dart';
import '../sign_up_view.dart';

class LoginViewBody extends StatefulWidget {
  static const String routeName = "LoginView";

  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  final _loginViewModel = GetIt.instance.get<LoginViewModel>();

  @override
  void dispose() {
    emailController.text;
    passwordController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginViewModel,
      child: BlocListener<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showLoadingIndicator(context);
          } else if (state is LoginSuccess) {
            popIfCan(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SignUpView(),
              ),
            );
          } else if (state is LoginError) {
            debugPrint('Login error');
            popIfCan(context);
            final message = extractErrorMessage(
                state.exception ?? Exception("Unknown error"));
            showErrorDialog(context: context, message: message);
          }
        },
        child: BlocBuilder<LoginViewModel, LoginState>(
          builder: (context, state) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Padding(
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
                          title: 'Login',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextField(
                          width: 0,
                          labelText: "Email",
                          hintText: "Enter your email",
                          obsecureText: false,
                          controller: emailController,
                          cursorColor: AppColors.blackBaseColor,
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
                        CustomTextField(
                          width: 0,
                          labelText: "Password",
                          hintText: "enter your password",
                          obsecureText: true,
                          controller: passwordController,
                          cursorColor: AppColors.blackBaseColor,
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
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColors.blackBaseColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            Text('Remember me', style: AppTextStyles.style13),
                            const Spacer(),
                            TextButton(
                              child: Container(
                                padding: EdgeInsets.zero,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.blackBaseColor,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                child: Text('Forget password?',
                                    style: AppTextStyles.style12),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordView()));
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        DefaultAppButton(
                          text: "Login",
                          onPressed: () async {
                            login();
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ActionText(
                          mainText: "Don't have an account?",
                          actionText: "Sign up",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpView()));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      _loginViewModel.login(emailController.text, passwordController.text);
    }
  }
}
