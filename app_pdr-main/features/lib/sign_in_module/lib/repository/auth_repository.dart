import 'package:core_pdr/api_helpers/requests_helpers.dart';

import '../utils/constants/api_endpoints.dart';
import 'models/auth_response.dart';

abstract class AuthRepository {
  dynamic auth(String email, String password);
}

class AuthRepositoryImplementation implements AuthRepository {
  CoreRequester coreRequester;
  AuthRepositoryImplementation(this.coreRequester);

  String authenticatedEndpoint = ApiEndpoints.endpointOne;
  @override
  Future<AuthResponse> auth(String email, String password) async {
    try {
      var response = await coreRequester.fetch(authenticatedEndpoint,
          body: _createAuthBody(email, password));
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> _createAuthBody(String _email, String _password) =>
      AuthResponse(login: _email, password: _password).toJson();
}
