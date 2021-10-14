import 'package:core_pdr/api_helpers/headers/header_utils.dart';
import 'package:core_pdr/api_helpers/requests_helpers.dart';
import 'package:core_pdr/api_helpers/urls/urls_address.dart';
import 'package:core_pdr/singleton_helpers/global_variables_utils.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:sing_module/repository/models/auth_response.dart';
import 'package:sing_module/utils/constants/api_endpoints.dart';

abstract class AuthRepository {
  dynamic auth(String email, String password);
}

class AuthRepositoryImplementation implements AuthRepository {
  CoreRequester coreRequester;
  AppSingletonUtils singletonUtils;
  AuthRepositoryImplementation(this.coreRequester, this.singletonUtils);
  @override
  Future<AuthResponse> auth(String email, String password) async {
    try {
      Response<dynamic> response = await coreRequester.fetch(
          singletonUtils.getAppApiAddressWithEndpoint(ApiEndpoints.endpointOne),
          body: _createAuthBody(email, password));
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> _createAuthBody(String _email, String _password) =>
      AuthResponse(login: _email, password: _password).toJson();
}
