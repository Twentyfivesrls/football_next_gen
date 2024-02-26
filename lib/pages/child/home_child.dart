import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';

class HomeChild extends StatefulWidget{
  const HomeChild({super.key});
  @override
  State<StatefulWidget> createState() => HomeChildState();
}


class HomeChildState extends State<HomeChild>{
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        firstTrailingIconOnTap: (){
          context.push(AppPage.menuChild.path);
        },
        secondTrailingIconOnTap: (){},
        goBack: (){},
        appBar: 3,
        showBackIcon: false,
        firstTrailingIcon: Icons.person,
        body: SingleChildScrollView(
          child: Center(
            child: TextH1(text: "Qua ci saranno i post"),
          ),
        ),
    );
  }
}