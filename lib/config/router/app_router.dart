import 'package:e_commerce/config/router/router_transitions.dart';
import 'package:e_commerce/config/router/routes.dart';
import 'package:e_commerce/features/auth/views/login_view.dart';
import 'package:e_commerce/features/products/views/products_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return RouterTransitions.build(LoginView());
      case Routes.products:
        return RouterTransitions.buildScale(ProductsView());
      default:
        return RouterTransitions.build(Scaffold(
          body: Center(
            child: Text("No Route"),
          ),
        ));
    }
  }

  // handle all routes transitions
}
