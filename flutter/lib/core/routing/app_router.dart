
import 'package:go_router/go_router.dart';
import 'package:smart_laundry/core/widgets/test_screen.dart';
import 'package:smart_laundry/features/main_screen.dart';
import 'package:smart_laundry/features/profile/presentation/views/addresses_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/welcome/presentation/views/welcome_view.dart';
import 'app_routes.dart';
import '../../features/auth/presentation/views/forgot_password_view.dart';

/// App router configuration
abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.services,
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordView(),

      ),
      GoRoute(
        path: AppRoutes.services,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRoutes.addresses,
        builder: (context, state) =>  AddressesView(),
      ),
      GoRoute(
        path: AppRoutes.testScreen,
        builder: (context, state) =>  const TestScreen(),
      ),

    ],
  );
}
