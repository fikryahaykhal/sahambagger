import 'package:auto_route/auto_route.dart';
import 'package:main/route/guard/dashboard_guard.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SurveyRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: BottomNavbarRoute.page, guards: [
          DashboardGuard()
        ], children: [
          AutoRoute(page: DashboardRoute.page, initial: true),
          AutoRoute(page: LearningRoute.page),
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: ProfileRoute.page),
          AutoRoute(page: TablesRoute.page),
        ])
      ];
}
