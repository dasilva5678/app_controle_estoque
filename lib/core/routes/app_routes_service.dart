import 'package:app_controle_estoque/core/enums/enum_routes.dart';
import 'package:app_controle_estoque/view/create%20account/create_account_view.dart';
import 'package:app_controle_estoque/view/home/home_view.dart';
import 'package:app_controle_estoque/view/login/login_view.dart';
import 'package:app_controle_estoque/view/splash%20screen/splash_screen_view.dart';
import 'package:app_controle_estoque/view/stock/stock_view.dart';
import 'package:flutter/material.dart';

class RouteService {
  static String getRouteName(EnumRoutes routeName) {
    switch (routeName) {
      case EnumRoutes.splash:
        return '/';
      case EnumRoutes.login:
        return '/login';
      case EnumRoutes.createAccount:
        return '/createAccount';
      case EnumRoutes.home:
        return '/home';
      case EnumRoutes.stock:
        return '/stock';
    }
  }

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RouteService.getRouteName(EnumRoutes.splash): (context) =>
          SplasScreenView(),
      RouteService.getRouteName(EnumRoutes.login): (context) => LoginView(),
      RouteService.getRouteName(EnumRoutes.createAccount): (context) =>
          CreateAccountView(),
      RouteService.getRouteName(EnumRoutes.home): (context) => HomeView(),
      RouteService.getRouteName(EnumRoutes.stock): (context) {
        final args = ModalRoute.of(context)!.settings.arguments as Map;
        return StockView(
          userId: args["userId"].toString(),
          auditId: args["auditId"].toString(),
          
        );
      },
    };
  }
}
