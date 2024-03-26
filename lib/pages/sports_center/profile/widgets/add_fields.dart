import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/single_field_input.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/texts.dart';

class AddFields extends StatelessWidget{

  final List<SportEntity> sports;
  TextEditingController fieldController;


  AddFields({super.key, required this.sports, required this.fieldController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text18(
          text: getCurrentLanguageValue(FIELDS) ?? "",
          textColor: primary,
        ),

        ...sports.map((e) => SingleFieldInput(
          labelText: e.name,
          fieldController: fieldController,
        )),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: DividerWidget(),
        )
      ],
    );
  }
}