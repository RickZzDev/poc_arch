import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../lib/repository/auth_repository.dart';
import '../../lib/repository/models/auth_response.dart';
import '../../lib/viewmodel/auth_view_model.dart';

class SpyAuthImplementation extends Mock implements AuthRepository {}

void main() {
  late SigninViewModel _authCubit;
  late AuthRepository _authRepository;

  setUp(() {
    _authRepository = SpyAuthImplementation();
    _authCubit = SigninViewModel(_authRepository);
  });

  tearDown(() {
    _authCubit.close();
  });

  test('Should emit [AuthLoading, AuthSuccess].', () {
    when(() => _authRepository.auth(any(), any())).thenAnswer(
      (realInvocation) async => Future.value(
          AuthResponse(login: "email_test", password: "password_test")),
    );
    expectLater(
        _authCubit.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthSuccess>()
              .having(
                (obj) => obj.response.login,
                "Should contain right email",
                "email_test",
              )
              .having(
                (obj) => obj.response.password,
                "Should contain right email",
                "password_test",
              )
        ]));
    _authCubit.auth("", "");
  });

  test('Should emit [AuthLoading, AuthError].', () {
    when(() => _authRepository.auth(any(), any())).thenThrow(Exception());
    expectLater(_authCubit.stream,
        emitsInOrder([isA<AuthLoading>(), isA<AuthError>()]));
    _authCubit.auth("", "");
  });
}
