import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/recover_password/recover_password_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';

class RecoverPassword extends StatefulWidget{
  const RecoverPassword({super.key});
  @override
  State<StatefulWidget> createState() => RecoverPasswordState();
}

class RecoverPasswordState extends State<RecoverPassword> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: RecoverPasswordForm(),
    );
  }
}