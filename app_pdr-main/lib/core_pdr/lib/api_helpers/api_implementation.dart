library api_helper;

import 'package:core_pdr/api_helpers/dio_interceptors/session_interceptor.dart';
import 'package:core_pdr/utils/session_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

abstract class ApiHelper {
  Future<dynamic> fetch(
    String url,
    Map<String, dynamic> header,
  );
  Future<dynamic> post(
    String url,
    Map<String, dynamic> header, {
    Map<String, dynamic>? body,
  });
  Future<dynamic> delete(
    String url,
    Map<String, dynamic> header, {
    Map<String, dynamic>? body,
  });
  Future<dynamic> put(
    String url,
    Map<String, dynamic> header, {
    Map<String, dynamic>? body,
  });
}

///Implemntação da lib do DIO
class DioRequester implements ApiHelper {
  DioForNative dio = DioForNative();
  DioRequester() {
    // dio.options.baseUrl = env['API_URL']!;
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {},
    ));
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    dio.interceptors.add(SessionInterceptor(SessionService(dio)));
    dio.options.connectTimeout = 60000;
  }

  @override
  Future fetch(String url, Map<String, dynamic> header) async {
    try {
      return await dio.get(
        url,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(String url, Map<String, dynamic> header,
      {Map<String, dynamic>? body}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future post(String url, Map<String, dynamic> header,
      {Map<String, dynamic>? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String url, Map<String, dynamic> header,
      {Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}

///Implementação da lib do Http
class HttpRequester implements ApiHelper {
  @override
  Future fetch(String url, Map<String, dynamic> header) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future delete(String url, Map<String, dynamic> header,
      {Map<String, dynamic>? body}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future post(String url, Map<String, dynamic> header,
      {Map<String, dynamic>? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future put(String url, Map<String, dynamic> header,
      {Map<String, dynamic>? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
