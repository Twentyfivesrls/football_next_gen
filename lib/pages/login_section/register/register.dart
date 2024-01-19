import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/register/register_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';

class Register extends StatefulWidget{
  const Register({super.key});
  @override
  State<StatefulWidget> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      goBack: (){},
      goHome: (){},
      body: const RegisterForm(),
    );
  }
}