import 'package:get/get.dart';
import 'package:moomalpublication/features/all%20categories/presentation/screens/all_categories.dart';
import 'package:moomalpublication/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/login_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/register_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/reset_password_on_success_screen.dart';
import 'package:moomalpublication/features/cart/presentation/screens/cart_screen.dart';
import 'package:moomalpublication/features/moomalpublication_app/moomalpublication_app.dart';
import 'package:moomalpublication/features/product_detail/presentation/screens/detail_page.dart';
import 'package:moomalpublication/features/product_detail/presentation/screens/similar_product_screen.dart';
import 'package:moomalpublication/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:moomalpublication/features/search/presentation/screens/search_screen.dart';
import 'package:moomalpublication/features/splash/presentation/screens/splash_screen.dart';
import 'package:moomalpublication/features/testimonial/presentation/screens/testimonial.dart';
import 'package:moomalpublication/routes/name_routes.dart';

class AppPages {
  AppPages();
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NameRoutes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.signinScreen,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.signupScreen,
      page: () => const RegisterScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.forgetPasswordScreen,
      page: () => const ForgetPasswordScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.resetPasswordOnSuccessScreen,
      page: () => const ResetPasswordOnSuccessScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.moomalpublicationApp,
      page: () => const MoomalPublicationApp(),
      transition: Transition.noTransition
    ),
    GetPage(
      name: NameRoutes.searchScreen,
      page: () => const SearchScreen(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.testimonialScreen,
      page: () => TestimonialScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.productDetailScreen,
      page: () => ProductDetailScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.cartScreen,
      page: () => CartScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.allCategoryScreen,
      page: () => AllCategoriesScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.similarProductScreen,
      page: () => SimilarProductScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.settingDetailScreen,
      page: () => SettingDetailedScreen(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.quizScreen,
      page: () => QuizScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
