import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_elevate/core/di/di.dart';
import 'package:online_exam_elevate/core/utils/theme.dart';
import 'package:online_exam_elevate/presentation/auth/views/login_view.dart';
import 'package:online_exam_elevate/presentation/auth/views/sign_up_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: const LoginView(),
          initialRoute: LoginView.routeName,
          routes: {
            SignUpView.routeName: (context) => const SignUpView(),
            LoginView.routeName: (context) => const LoginView(),
          },
        );
      },
    );
  }
}
