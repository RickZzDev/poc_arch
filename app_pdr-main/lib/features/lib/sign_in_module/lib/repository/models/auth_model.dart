import 'package:flutter/material.dart';

import 'auth_response.dart';

///Classe model que deve ser emitida no estado da cubit para a tela
///Deve conter o que é necessário para a tela e conter prorpiedades pertinentes
///para deixar a tela livre de tratamentos desse tipo ex: profileColor
class AuthModel {
  String? login;
  String? password;
  late bool isLoginTooShort;
  late Color profileColor;

  AuthModel.fromAuthResponse(AuthResponse _authResponse) {
    isLoginTooShort = _authResponse.login!.length < 8;
    _defineStatus(_authResponse.status);
  }

  Color _defineStatus(status) {
    Color _colorToReturn;
    switch (status) {
      case "admin":
        _colorToReturn = Colors.red;
        break;
      default:
        _colorToReturn = Colors.pink;
    }

    return _colorToReturn;
  }
}
