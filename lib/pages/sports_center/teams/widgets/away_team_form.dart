import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/inputs.dart';
import 'package:football_next_gen/widgets/texts.dart';

class AwayTeamForm extends StatelessWidget{
  TextEditingController nameController;
  TextEditingController managerController;
  TextEditingController descriptionController;
  TextEditingController coachController;
  final Function() uploadLogo;

  AwayTeamForm({
    super.key,
    required this.nameController,
    required this.coachController,
    required this.managerController,
    required this.descriptionController,
    required this.uploadLogo,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: InputWidget(
            controller: nameController,
            labelText: "Nome società*",
            hintText: getCurrentLanguageValue(TEAM_NAME) ?? "" ,
          ),
        ),


      ],

    );
  }

}