import 'package:go_router/go_router.dart';
import 'package:smart_laundry/features/services/presentation/views/services_view.dart';
import '../../features/welcome/presentation/views/welcome_view.dart';
import 'app_routes.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.services,
    routes: [
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: AppRoutes.services,
        builder: (context, state) => const ServicesView(),
      ),
    ],
  );
}
