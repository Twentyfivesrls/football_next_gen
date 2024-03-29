import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/models/sport_field.dart';
import 'package:football_next_gen/pages/sports_center/profile/widgets/single_sport_selection.dart';
import 'package:football_next_gen/widgets/autocomplete.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/texts.dart';

class AddSports extends StatelessWidget{

  final List<String> kOptions;
  final List<SportEntity> sports;
  final Function() removeSport;

  const AddSports({super.key, required this.kOptions, required this.sports, required this.removeSport});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text18(
          text: getCurrentLanguageValue(SPORTS) ?? "",
          textColor: primary,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AutocompleteWidget(
            kOptions: kOptions,
            hintText: 'Seleziona uno sport da aggiungere',
            labelText: "Sports",
          ),
        ),

        ...sports.map((e) => SingleSelection(
            name: e.name,
            labelText: "Sport ${sports.indexOf(e) + 1}",
            remove: removeSport
        )),


        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: DividerWidget(),
        )
      ],
    );
  }
}