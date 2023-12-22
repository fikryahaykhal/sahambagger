import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main/data/services/prefs/preferences.dart';
import 'package:main/domain/repository/user_repository.dart';
import 'package:main/domain/uimodel/profile_ui_model.dart';
import 'package:main/route/app_router.gr.dart';
import 'package:main/injector.dart' as di;

class DashboardGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final repository = di.locator<UserRepository>();
    final result = await repository.getCurrentUser();

    result.fold(
      (error) {
        debugPrint('Error Dashboard Guard : ${error.message}');
        _invalidRoute(resolver);
      },
      (data) => _validRoute(resolver, data.profile),
    );
  }

  void _validRoute(NavigationResolver resolver, ProfileUiModel? profile) {
    if (profile == null) {
      resolver.redirect(const RegisterRoute());
    } else {
      resolver.next();
    }
  }

  void _invalidRoute(NavigationResolver resolver) async {
    final isWasStarted = await Prefs.isWasStarted();

    if (isWasStarted) {
      resolver.redirect(const LoginRoute());
    } else {
      resolver.redirect(const OnboardingRoute());
    }
  }
}
