import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/register/parent/parent_register_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';

import '../../../../constants/app_pages.dart';

class ParentRegister extends StatefulWidget{
  const ParentRegister({super.key});
  @override
  State<StatefulWidget> createState() => ParentRegisterState();
}


class ParentRegisterState extends State<ParentRegister>{
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        paddingTop: 0,
        appBar: 1,
        title: AppPage.parentRegister.toTitle,
        body: const ParentRegisterForm()
    );
  }
}