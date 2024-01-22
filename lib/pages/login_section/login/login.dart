import 'package:flutter/material.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'login_form.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        goBack: (){},
        goHome: (){},
        body: WillPopScope(
          onWillPop: () async => false,
          child: const LoginForm(),
        )
      );
  }
}