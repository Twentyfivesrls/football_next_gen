import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/login_section/register/sports_center/sports_center_register_form.dart';
import 'package:football_next_gen/widgets/scaffold.dart';

import '../../../../constants/app_pages.dart';

class SportsCenterRegister extends StatefulWidget{
  const SportsCenterRegister({super.key});
  @override
  State<StatefulWidget> createState() => SportsCenterRegisterState();
}


class SportsCenterRegisterState extends State<SportsCenterRegister>{
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        firstTrailingIconOnTap: (){},
        secondTrailingIconOnTap: (){},
        goBack: (){},
        paddingTop: 0,
        appBar: 1,
        title: AppPage.sportsCenterRegister.toTitle,
        body: const SportsCenterRegisterForm()
    );
  }
}