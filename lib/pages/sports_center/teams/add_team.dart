import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/models/confirm_page_data.dart';
import 'package:football_next_gen/pages/sports_center/teams/widgets/add_team_form.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/language.dart';
import '../../../widgets/texts.dart';

class AddTeam extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AddTeamState();

}

class AddTeamState extends State<AddTeam>{

  TextEditingController nameController = TextEditingController();
  TextEditingController coachController = TextEditingController();
  TextEditingController managerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      goBack: (){
        context.pop();
      },
      paddingTop: 30,
      appBar: 3,
      showTrailingIcon: false,
      title: AppPage.addTeam.toTitle,
      goHome: (){},
      body: SingleChildScrollView(
        child: Column(
          children: [
            formSection(),
            buttonsSection()
          ],
        )
      ),
    );
  }


  Widget formSection() {
    return AddTeamForm(
      nameController: nameController,
      coachController: coachController,
      managerController: managerController,
      descriptionController: descriptionController,
      uploadLogo: () {  },
    );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: DividerWidget(),
        ),
        
        ActionButton(
            onPressed: (){
              context.go(AppPage.confirmPage.path, extra: ConfirmPageData.addTeamConfirmed(context));
            },
            text: getCurrentLanguageValue(ADD_TEAM) ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
              onPressed: (){
                context.pop();
              },
              text: getCurrentLanguageValue(CANCEL) ?? "",
              backgroundColor: cancelGrey,
              borderColor: cancelGrey,
          ),
        ),

      ],
    );
  }

}