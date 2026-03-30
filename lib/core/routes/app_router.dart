import 'package:book_ia/core/routes/routes.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:book_ia/features/auth/presentation/page/forgot%20password/forgot_password_screen.dart';
import 'package:book_ia/features/auth/presentation/page/login/login_screen.dart';
import 'package:book_ia/features/auth/presentation/page/new_password/new_password_screen.dart';
import 'package:book_ia/features/auth/presentation/page/otp/otp_screen.dart';
import 'package:book_ia/features/auth/presentation/page/password_changed/password_changed_screen.dart';
import 'package:book_ia/features/auth/presentation/page/register/register_screen.dart';
import 'package:book_ia/features/detalis/presentation/page/detalis_screen.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/home/data/repository/home_repo.dart';
import 'package:book_ia/features/home/presentation/search/presentation/page/search_screen.dart';
import 'package:book_ia/features/intro/splash/splash_screen.dart';
import 'package:book_ia/features/intro/welcom/welcome_screen.dart';
import 'package:book_ia/features/main/main_app_screen.dart';
import 'package:book_ia/features/place_order/presentation/page/place_order_screen.dart';
import 'package:book_ia/features/profile/presentation/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:book_ia/features/profile/presentation/edit_profile/page/edit_profile_screen.dart';
import 'package:book_ia/features/success/presentation/succese_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(path: Routes.otp, builder: (context, state) => const OtpScreen()),
      GoRoute(
        path: Routes.main,
        builder: (context, state) {
          var selectedIndex = state.extra as int?;
          return MainAppScreen(selectedIndex: selectedIndex);
        },
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
      GoRoute(
        path: Routes.placeOrder,
        builder: (context, state) {
          return PlaceOrderScreen(total: state.extra as String);
        },
      ),
      GoRoute(
        path: Routes.success,
        builder: (context, state) => const SucceseScreen(),
      ),

      GoRoute(
        path: Routes.search,
        builder: (context, state) => SearchScreen(repo: HomeRepo()),
      ),
      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) => BlocProvider(
          create: (context) => EditProfileCubit()..loadInitData(),
          child: const EditProfileScreen(),
        ),
      ),
    ],
  );
}
