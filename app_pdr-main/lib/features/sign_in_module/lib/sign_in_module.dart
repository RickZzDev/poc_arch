library sing_module;

import 'package:core_pdr/api_helpers/requests_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository/auth_repository.dart';
import 'view/views/signin/signin_view.dart';
import 'viewmodel/auth_view_model.dart';

class SingInBuilder extends StatelessWidget {
  const SingInBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninViewModel(
        AuthRepositoryImplementation(
          CoreRequester(),
        ),
      ),
      child: const SigninPage(),
    );
  }
}
