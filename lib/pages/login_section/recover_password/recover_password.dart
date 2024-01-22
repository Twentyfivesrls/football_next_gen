import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/recover_password/recover_password_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';


class RecoverPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      goBack: (){},
      goHome: (){},
      body: RecoverPasswordForm(),
    );
  }
}