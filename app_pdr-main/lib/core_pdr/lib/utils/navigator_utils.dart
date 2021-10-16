import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

///Esta classe serve  como um fix para o problema de conseguir chamar mais
///de uma vez a mesma tela na pilha
///Este fiz é provisório e deve ser descartado após a refatoração ou após
///encontrar a causa do BUG
///

abstract class NavigatorUtils {
  static bool _isNavigating = false;
  static Future<Object?> preventDoubleRoute(
      {required String newRoute, Map<String, dynamic>? arguments}) async {
    if (!_isNavigating) {
      _isNavigating = true;
      _startTimer();
      Object? _value =
          await Modular.to.pushNamed(newRoute, arguments: arguments);
      _isNavigating = false;
      return _value;
    }
  }

  ///Este timer ira retornar a flag para falso, para habilitar a navegação novamente
  static _startTimer() async {
    Future.delayed(Duration(milliseconds: 800)).then(
      (value) {
        _isNavigating = false;
      },
    );
  }
}
