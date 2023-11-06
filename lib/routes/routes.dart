import 'package:app_clima/presentation/pages/details/details.dart';
import 'package:app_clima/presentation/pages/details_screen/details_screen.dart';
import 'package:app_clima/presentation/pages/feedback_screen/feedback_screen.dart';
import 'package:app_clima/presentation/pages/searching/searching.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SearchingPage(),
    ),
    GoRoute(
      path: "/details_screen",
      builder: (context, state) => const DetailsScreen(),
    ),
    GoRoute(
      path: "/details_two",
      builder: (context, state) => const Details(),
    ),
    GoRoute(
      path: "/feedback_screen",
      builder: (context, state) => const FeedbackScreen(),
    ),
  ],
);
