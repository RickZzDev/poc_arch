import 'package:core_pdr/utils/session_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:overlay_support/overlay_support.dart';

class SessionInterceptor extends Interceptor {
  final SessionService _sessionService;

  SessionInterceptor(this._sessionService);

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      var user = await this._sessionService.retrieve();
      if ((err.response!.statusCode == 401 ||
              err.response!.statusCode == 403) &&
          user != null) {
        this._sessionService.destroy();
        showSimpleNotification(
            Text(
              "Sua sessão expirou",
            ),
            duration: Duration(seconds: 3),
            background: Colors.red,
            position: NotificationPosition.bottom);
        Modular.to.navigate('/auth');
      }
    }

    return super.onError(err, handler);
  }
}
