import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/register/register_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      goBack: (){},
      firstTrailingIconOnTap: (){},
      secondTrailingIconOnTap: (){},
      body: const RegisterForm(),
    );
  }
}