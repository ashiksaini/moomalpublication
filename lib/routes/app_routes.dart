import 'package:get/get.dart';
import 'package:moomalpublication/features/address/presentation/screens/address_screen.dart';
import 'package:moomalpublication/features/all_categories/presentation/screens/all_categories.dart';
import 'package:moomalpublication/features/all_categories/presentation/screens/category_wise.dart';
import 'package:moomalpublication/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/login_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/register_screen.dart';
import 'package:moomalpublication/features/auth/presentation/screens/reset_password_on_success_screen.dart';
import 'package:moomalpublication/features/cart/presentation/screens/cart_screen.dart';
import 'package:moomalpublication/features/contact_us/presentation/screen/contact_us_screen.dart';
import 'package:moomalpublication/features/downloads/presentation/screens/download_screen.dart';
import 'package:moomalpublication/features/event_press_release/presentation/screen/detail_event_page.dart';
import 'package:moomalpublication/features/event_press_release/presentation/screen/event_press_release_screen.dart';
import 'package:moomalpublication/features/moomalpublication_app/moomalpublication_app.dart';
import 'package:moomalpublication/features/my_orders/presentation/screen/ebook_order.dart';
import 'package:moomalpublication/features/my_orders/presentation/screen/my_order.dart';
import 'package:moomalpublication/features/orders/presentation/screen/orders_screen.dart';
import 'package:moomalpublication/features/online_test_series/presentation/screen/online_exam.dart';
import 'package:moomalpublication/features/online_test_series/presentation/screen/overall_result_screen.dart';
import 'package:moomalpublication/features/pdf_viewer/pdf_viewer_screen.dart';
import 'package:moomalpublication/features/product_detail/presentation/screens/detail_page.dart';
import 'package:moomalpublication/features/product_detail/presentation/screens/similar_product_screen.dart';
import 'package:moomalpublication/features/quiz/presentation/screens/quiz_screen.dart';
import 'package:moomalpublication/features/quiz/presentation/screens/quiz_test_screen.dart';
import 'package:moomalpublication/features/search_books/presentation/screens/search_screen.dart';
import 'package:moomalpublication/features/settings/presentation/screens/setting_detailed_screen.dart';
import 'package:moomalpublication/features/settings/presentation/screens/setting_screen.dart';
import 'package:moomalpublication/features/test_series/presentation/screen/test_series_screen.dart';
import 'package:moomalpublication/features/testimonial/presentation/screens/testimonial.dart';
import 'package:moomalpublication/features/thank_you_page/presentation/screen/order_success_screen.dart';
import 'package:moomalpublication/features/thank_you_page/presentation/screen/thank_you_screen.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/features/quiz/presentation/screens/quiz_detail_screen.dart';

class AppPages {
  AppPages();
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NameRoutes.splashScreen,
      page: () => EbookOrderScreen(),
      transition: Transition.rightToLeft,
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
      transition: Transition.noTransition,
    ),
    GetPage(
      name: NameRoutes.searchScreen,
      page: () => SearchProductScreen(),
      transition: Transition.upToDown,
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
      page: () => const CartScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.allCategoryScreen,
      page: () => const AllCategoriesScreen(),
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
      name: NameRoutes.testimonialScreen,
      page: () => TestimonialScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.settingsScreen,
      page: () => SettingScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.settingDetailScreen,
      page: () => SettingDetailedScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.quizScreen,
      page: () => const QuizScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.downloadScreen,
      page: () => DownloadScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.addressesScreen,
      page: () => AddressScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.orderScreen,
      page: () => OrdersScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.eventAndPressReleaseScreen,
      page: () => const EventAndPressReleaseScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.contactUsScreen,
      page: () => ContactUsScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.testSeriesScreen,
      page: () => const TestSeriesScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.overallResultScreen,
      page: () => const OverallResultScreen(),
      // page: () => PdfViewerScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.onlineTestSeriesScreen,
      page: () => const OnlineExamScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.detailEventScreen,
      page: () => DetailedEventPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.quizTestScreen,
      page: () => QuizTestScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.quizTestDetailScreen,
      page: () => QuizDetailScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.categoryWiseScreen,
      page: () => CategoryWiseScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.pdfScreen,
      page: () => PdfViewerScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
    GetPage(
      name: NameRoutes.thankYouPage,
      page: () => ThankYouScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 200),
    ),
  ];
}
