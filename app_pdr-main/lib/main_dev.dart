import 'package:app_pdr/route_controller/generate_route.dart';
import 'package:core_pdr/api_helpers/urls/urls_address.dart';
import 'package:core_pdr/singleton_helpers/global_variables_utils.dart';
import 'package:flutter/material.dart';
import 'package:sing_module/sign_in_module.dart';
import 'package:get_it/get_it.dart';

void main() {
  AppSingletonUtils.setUp("DEV");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: GenerateRoute.generateRoute,
      home: SingInBuilder(),
    );
  }
}
