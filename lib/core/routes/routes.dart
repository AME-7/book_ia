import 'package:book_ia/features/auth/presentation/page/forgot%20password/forgot_password_screen.dart';
import 'package:book_ia/features/auth/presentation/page/login/login_screen.dart';
import 'package:book_ia/features/auth/presentation/page/new_password/new_password_screen.dart';
import 'package:book_ia/features/auth/presentation/page/otp/otp_screen.dart';
import 'package:book_ia/features/auth/presentation/page/password%20changed/password_changed_screen.dart';
import 'package:book_ia/features/auth/presentation/page/register/register_screen.dart';
import 'package:book_ia/features/intro/splash/splash_screen.dart';
import 'package:book_ia/features/intro/welcom/welcome_screen.dart';
import 'package:book_ia/features/main/main_app_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String splash = '/';
  static String login = 'login';
  static String register = 'register';
  static String welcome = 'welcom';
  static String otp = 'otp';
  static String main = 'main';
  static String nawPassword = 'now password';
  static String passwordChaged = 'password changed';
  static String forgot = 'forgot';
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(path: otp, builder: (context, state) => const OtpScreen()),
      GoRoute(path: main, builder: (context, state) => const MainAppScreen()),
      GoRoute(
        path: nawPassword,
        builder: (context, state) => const NewPasswordScreen(),
      ),
      GoRoute(
        path: passwordChaged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: forgot,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}
