import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/register/parent/parent_register_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';

class ParentRegister extends StatefulWidget{
  const ParentRegister({super.key});
  @override
  State<StatefulWidget> createState() => ParentRegisterState();
}


class ParentRegisterState extends State<ParentRegister>{
  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
        body: ParentRegisterForm()
    );
  }
}