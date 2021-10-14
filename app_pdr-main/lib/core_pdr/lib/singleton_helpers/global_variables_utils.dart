import 'package:core_pdr/api_helpers/urls/urls_address.dart';
import 'package:get_it/get_it.dart';

class AppSingletonUtils {
  static final getIt = GetIt.instance;
  static void setUp(String env) {
    (env == "DEV") ? _setDevVariables() : _setProdVariables();
  }

  String getAppApiAddressWithEndpoint(String endpoint) =>
      getIt.get<AppUrl>().baseUrlWithEndpoint(endpoint);

  static _setDevVariables() => getIt.registerSingleton<AppUrl>(AppDevUrl());

  static _setProdVariables() => getIt.registerSingleton<AppUrl>(AppDevUrl());
}
