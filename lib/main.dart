import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const ReilloFacebook());

class ReilloFacebook extends StatelessWidget {
  const ReilloFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook Replication',
          initialRoute: '/Login',
          routes: {
            '/Home': (context) => const HomeScreen(),
            '/Login': (context) => const LogInScreen(),
            '/Register': (context) => const RegisterScreen(),
            '/splash': (context) => const SplashScreen(),
          },
        );
      },
    );
  }
}