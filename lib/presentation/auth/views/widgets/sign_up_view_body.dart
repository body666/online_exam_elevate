import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:online_exam_elevate/core/utils/widgets/custom_text_field.dart';
import 'package:online_exam_elevate/core/utils/widgets/default_app_button.dart';
import 'package:online_exam_elevate/data/models/request/register_request.dart';
import 'package:online_exam_elevate/domain/usecases/auth/register_usecase.dart';
import 'package:online_exam_elevate/presentation/auth/views/widgets/redirect_text_action.dart';

import '../../../../core/utils/text_styles.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: AppTextStyles.style20,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  width: 0,
                  labelText: "User name",
                  hintText: "Enter your user name",
                  obsecureText: false,
                  controller: usernameController,
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
                    )),
                    SizedBox(width: 16.w),
                    Expanded(
                        child: CustomTextField(
                      width: 0,
                      labelText: "Confirm password",
                      hintText: "Confirm password",
                      obsecureText: true,
                      controller: confirmPasswordController,
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
                    if (_formKey.currentState!.validate()) {
                      final registerUseCase =
                          GetIt.instance.get<RegisterUseCase>();
                      final result = await registerUseCase.invoke(
                        RegisterRequest(
                          email: emailController.text,
                          password: passwordController.text,
                          lastName: lastNameController.text,
                          firstName: firstNameController.text,
                          username: usernameController.text,
                          rePassword: confirmPasswordController.text,
                          phone: phoneNumberController.text,
                        ),
                      );
                      // Handle the result, such as showing success or error
                    }
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
        ),
      ),
    );
  }
}
