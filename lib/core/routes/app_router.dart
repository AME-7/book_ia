import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/features/auth/presentation/page/forgot%20password/forgot_password_screen.dart';
import 'package:book_ia/features/auth/presentation/page/login/login_screen.dart';
import 'package:book_ia/features/auth/presentation/page/new_password/new_password_screen.dart';
import 'package:book_ia/features/auth/presentation/page/otp/otp_screen.dart';
import 'package:book_ia/features/auth/presentation/page/password%20changed/password_changed_screen.dart';
import 'package:book_ia/features/auth/presentation/page/register/register_screen.dart';
import 'package:book_ia/features/detalis/presentation/page/detalis_screen.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/intro/splash/splash_screen.dart';
import 'package:book_ia/features/intro/welcom/welcome_screen.dart';
import 'package:book_ia/features/main/main_app_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(path: Routes.otp, builder: (context, state) => const OtpScreen()),
      GoRoute(
        path: Routes.main,
        builder: (context, state) => const MainAppScreen(),
      ),
      GoRoute(
        path: Routes.nawPassword,
        builder: (context, state) => const NewPasswordScreen(),
      ),
      GoRoute(
        path: Routes.passwordChaged,
        builder: (context, state) => const PasswordChangedScreen(),
      ),
      GoRoute(
        path: Routes.forgot,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.detalis,
        builder: (context, state) {
          return DetalisScreen(model: state.extra as Product);
        },
      ),
    ],
  );
}

class Routers {}
