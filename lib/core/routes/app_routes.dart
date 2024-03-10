import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  static NavigationService? _instance;
  NavigationService._internal();

  static NavigationService get instance {
    _instance ??= NavigationService._internal();
    return _instance!;
  }

  static void initialize() {
    _instance = NavigationService._internal();
  }

  Future<dynamic> navigateTo(EnumRoutes routeName, {Object? arguments}) {
    String route = _getRoute(routeName);
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState!.pushNamed(route, arguments: arguments);
    } else {
      return Future.error('Navigator key is not ready');
    }
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

  String _getRoute(EnumRoutes routeName) {
    switch (routeName) {
      case EnumRoutes.login:
        return '/login';
      case EnumRoutes.createAccount:
        return '/createAccount';
      case EnumRoutes.home:
        return '/home';
      case EnumRoutes.stock:
        return '/stock';
      default:
        throw Exception('Route not found');
    }
  }
}
