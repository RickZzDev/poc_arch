// import 'package:facily_widgets/widgets/buttons/loading_button/loading_button.dart';
// import 'package:facily_widgets/widgets/buttons/loading_button/loading_button_controller.dart';
// import 'package:facily_widgets/widgets/forms/primary_text_field_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class CustomForm extends StatelessWidget {
//   final Function(String, String) onPressed;
//   CustomForm({Key? key, required this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.zero,
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 24, bottom: 8.0),
//             child: Text('Entre com seu email',
//                 style: Theme.of(context).textTheme.headline2),
//           ),
//           const PrimaryTextFieldWidget(
//             key: ValueKey('email_input'),
//             name: 'email',
//             label: 'Email',
//             // validators: UserModel.rules(context, 'username'),
//             keyboardType: TextInputType.emailAddress,
//           ),
//           const PrimaryTextFieldWidget(
//             key: ValueKey('password_input'),
//             name: 'password',
//             label: 'Senha',
//             obscureText: true,
//             // validators: UserModel.rules(context, 'password'),
//           ),
//           LoadingButton(
//             'Entrar',
//             () => onPressed("", ""),
//             LoadingButtonController(),
//             key: const ValueKey('signin_btn'),
//           ),
//           // _forgotLink(),
//         ],
//       ),
//     );
//   }
// }
