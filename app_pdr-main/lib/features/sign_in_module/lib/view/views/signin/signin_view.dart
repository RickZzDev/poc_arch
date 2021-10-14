import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sing_module/view/components/logo_component.dart';
import 'package:sing_module/view/components/page_title.dart';

import '../../../viewmodel/auth_view_model.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({
    Key? key,
  }) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  late SigninViewModel cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<SigninViewModel>(context);
    super.initState();
  }

  void _showSnackBar() => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao autenticar"),
        ),
      );

  void handleTriggers(state) {
    switch (state.runtimeType) {
      case AuthLoading:
        break;
      case AuthSuccess:
        Navigator.pushNamed(context, "/faily-home-page");
        break;
      case AuthError:
        _showSnackBar();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocListener<SigninViewModel, AuthState>(
        listener: (context, state) => handleTriggers(state),
        child: SafeArea(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: const [
              Logo(),
              PageTitle(),
              ButtonBar(),
            ],
          ),
        ),
      ),
    );
  }
}
