import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/register/sports_center/sports_center_register_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';

class SportsCenterRegister extends StatefulWidget{
  const SportsCenterRegister({super.key});
  @override
  State<StatefulWidget> createState() => SportsCenterRegisterState();
}


class SportsCenterRegisterState extends State<SportsCenterRegister>{
  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
        body: SportsCenterRegisterForm()
    );
  }
}