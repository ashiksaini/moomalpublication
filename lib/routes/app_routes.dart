import 'package:get/get.dart';
import 'package:moomalpublication/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/login_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/register_screen.dart';
import 'package:moomalpublication/features/splash/presentation/screens/splash_screen.dart';
import 'package:moomalpublication/routes/name_routes.dart';

class AppPages {
  AppPages();
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NameRoutes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: NameRoutes.signinScreen,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: NameRoutes.signupScreen,
      page: () => const RegisterScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: NameRoutes.signupScreen,
      page: () => const RegisterScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    GetPage(
      name: NameRoutes.forgetPasswordScreen,
      page: () => const ForgetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
