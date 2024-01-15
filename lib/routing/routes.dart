import 'package:football_next_gen/pages/login_section/login/login.dart';
import 'package:football_next_gen/pages/login_section/recover_password/recover_password.dart';
import 'package:football_next_gen/pages/login_section/recover_password/recover_password_confirmed.dart';
import 'package:go_router/go_router.dart';
import '../pages/login_section/register/parent/parent_register.dart';
import '../pages/login_section/register/register.dart';
import '../pages/login_section/register/sports_center/sports_center.dart';


class RouterManager {
  static final RouterManager _router = RouterManager._internal();
  factory RouterManager() {
    return _router;
  }

  RouterManager._internal();

  final GoRouter goRouter =
  GoRouter(
    routes: [
      // Go_router default goes to "/" page
      GoRoute(
          path: "/",
          builder: (context, state) => const Login()
      ),
      GoRoute(
          path: "/register",
          builder: (context, state) => const Register()
      ),
      GoRoute(
          path: "/recover_password",
          builder: (context, state) => const RecoverPassword()
      ),

      GoRoute(
          path: "/recover_password_confirmed",
          builder: (context, state) => const RecoverPasswordConfirmed()
      ),

      GoRoute(
          path: "/sports_center_register",
          builder: (context, state) => const SportsCenterRegister()
      ),

      GoRoute(
          path: "/parent_register",
          builder: (context, state) => const ParentRegister()
      ),

    ],
  );
}