import 'package:amity_nt/amity/app/config/router/routes_name.dart';
import 'package:amity_nt/amity/features/presentation/pages/forgot_password.dart';
import 'package:amity_nt/amity/features/presentation/pages/login_screen.dart';
import 'package:amity_nt/amity/features/presentation/pages/tab_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreenPage(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPassword(),
    ),
    GetPage(
      name: Routes.tabScreen,
      page: () => const TabScreenPage(),
    )
  ];
}
