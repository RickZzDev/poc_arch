import 'package:core_pdr/api_helpers/requests_helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../lib/repository/auth_repository.dart';
import '../../lib/repository/models/auth_response.dart';

class SpyCoreRequesterImplementation extends Mock implements CoreRequester {}

void main() {
  late CoreRequester _coreRequester;
  late AuthRepository _authRepository;

  setUp(() {
    _coreRequester = SpyCoreRequesterImplementation();
    _authRepository = AuthRepositoryImplementation(
      _coreRequester,
    );
  });

  test('Should throw Exception', () async {
    when(() => _coreRequester.fetch(any())).thenThrow(Exception());

    expect(() async => await _authRepository.auth("", ""),
        throwsA(isA<Exception>()));
  });

  test('Should return AuthModel with right values', () async {
    Map<String, dynamic> dataResponse = {
      "login": "test_name",
      "password": "test_password"
    };

    when(() => _coreRequester.fetch(any())).thenAnswer(
      (invocation) async => Response(
          requestOptions: RequestOptions(path: ""), data: dataResponse),
    );

    var response = await _authRepository.auth("email", "password");

    expect(
        response,
        isA<AuthResponse>()
            .having((obj) => obj.login, "verify login", "test_name")
            .having((obj) => obj.password, "Verify password", "test_password"));
  });
}
