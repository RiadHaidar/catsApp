import 'package:go_router/go_router.dart';
import 'home_screen.dart';
import 'routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
