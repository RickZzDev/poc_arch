import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:core_pdr/constants/app_routes.dart';
import 'package:sing_module/sign_in_module.dart';

////Route manager
abstract class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      ///Chama o entrypoint de cada modulo
      case AppRoutes.signIn:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => SingInBuilder(),
        );
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) => Scaffold());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
