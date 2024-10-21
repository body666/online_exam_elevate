import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/colors.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_text_field.dart';
import 'package:online_exam_elevate/domain/usecases/auth/login_usecase.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/forget_pass/forget_password_view_body.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/redirect_text_action.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/sign_up_view_body.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/widgets/default_app_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: AppTextStyles.style20,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            // Add constraints here
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context)
                  .size
                  .height, // Ensure the height takes up the full screen
            ),
            child: IntrinsicHeight(
              // Ensure proper layout of the Column
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      width: 0,
                      labelText: "Email",
                      hintText: "Enter your email",
                      obsecureText: false,
                      controller: emailController,
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
                      hintText: "Enter your password",
                      obsecureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return " enter your password";
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
                                        ForgetPasswordViewBody()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    DefaultAppButton(
                      text: "Login",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final loginUseCase =
                              GetIt.instance.get<LoginUseCase>();
                          final result = await loginUseCase.invoke(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
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
                                builder: (context) => const SignUpViewBody()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
