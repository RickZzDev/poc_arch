import 'package:core_pdr/api_helpers/requests_helpers.dart';
import 'package:core_pdr/singleton_helpers/global_variables_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
import 'package:sing_module/viewmodel/auth_view_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sing_module/repository/auth_repository.dart';
import 'package:sing_module/repository/models/auth_response.dart';

class SpyCoreRequesterImplementation extends Mock implements CoreRequester {}

class SpySingletonUtils extends Mock implements AppSingletonUtils {}

void main() {
  late CoreRequester _coreRequester;
  late AuthRepository _authRepository;
  late AppSingletonUtils _singletonUtils;

  setUp(() {
    _singletonUtils = SpySingletonUtils();
    _coreRequester = SpyCoreRequesterImplementation();
    _authRepository =
        AuthRepositoryImplementation(_coreRequester, _singletonUtils);
  });

  test('Should throw Exception', () async {
    when(() => _singletonUtils.getAppApiAddressWithEndpoint(any()))
        .thenAnswer((invocation) => "test.com.br");
    when(() => _coreRequester.fetch(any())).thenThrow(Exception());

    expect(() async => await _authRepository.auth("", ""),
        throwsA(isA<Exception>()));
  });

  test('Should return AuthModel with right values', () async {
    Map<String, dynamic> dataResponse = {
      "login": "test_name",
      "password": "test_password"
    };
    when(() => _singletonUtils.getAppApiAddressWithEndpoint(any()))
        .thenAnswer((invocation) => "test.com.br");
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
