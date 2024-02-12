import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/language.dart';
import '../../../models/team_entity.dart';
import '../../../widgets/autocomplete.dart';
import '../../../widgets/buttons.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<StatefulWidget> createState() => FiltersState();
}

class FiltersState extends State<Filters> {
  static const List<String> teamsList = <String>[
    'US Tigri Tuonanti',
    'AS Football Club',
    'Soccer Team FC',
  ];
  static const List<String> fieldsList = <String>[
    'Campo A1',
    'Campo A2',
    'Campo A3',
  ];
  List<TeamEntity> selectedTeams = [];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 2,
      paddingTop: 0,
      showTrailingIcon: false,
      title: AppPage.filters.toTitle,
      goHome: () {},
      goBack: () {},
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [buttonsSection()],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: AutocompleteWidget(
                kOptions: teamsList,
                hintText: 'Seleziona squadra/e',
                labelText: getCurrentLanguageValue(TEAM) ?? "",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: AutocompleteWidget(
                kOptions: fieldsList,
                hintText: 'Seleziona campo/i',
                labelText: getCurrentLanguageValue(FIELD) ?? "",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
            onTap: (){
              setState(() {
              });
            },
            child: Text14(
                text: getCurrentLanguageValue(FILTERS_RESET) ?? "",
                underline: true,
                fontWeight: FontWeight.w600,
             ),
          ),
        ),
        ActionButton(
          onPressed: () {
            context.pop();
          },
          text: getCurrentLanguageValue(APPLY) ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: () {
              context.pop();
            },
            text: getCurrentLanguageValue(CANCEL) ?? "",
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,
          ),
        )
      ],
    );
  }
}
