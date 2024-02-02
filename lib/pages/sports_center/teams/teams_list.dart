import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/pages/sports_center/teams/widgets/team_card.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/choice_chip.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';
import '../../../models/team_entity.dart';

class TeamsList extends StatefulWidget {
  const TeamsList({super.key});

  @override
  State<StatefulWidget> createState() => TeamListState();
}

class TeamListState extends State<TeamsList> {
  var teams = [
    TeamEntity(
        name: 'US Tigri Tuonanti',
        manager: 'Manager',
        coach: 'Coach',
        description: 'Descrizione',
        svgLogo: ImagesConstants.teamLogoImg,
        isHomeTeam: true),
    TeamEntity(
        name: 'Nome molto molto molto lungo di prova',
        manager: 'Manager',
        coach: 'Coach',
        description: 'Descrizione',
        svgLogo: ImagesConstants.teamLogoImg,
        isHomeTeam: false
    ),
    TeamEntity(
        name: 'Team 3',
        manager: 'Manager',
        coach: 'Coach',
        description: 'Descrizione',
        svgLogo: ImagesConstants.teamLogoImg,
        isHomeTeam: true
    ),
    TeamEntity(
        name: 'Team 4',
        manager: 'Manager',
        coach: 'Coach',
        description: 'Descrizione',
        svgLogo: ImagesConstants.teamLogoImg,
        isHomeTeam: true
    ),

    TeamEntity(
        name: 'Team 5',
        manager: 'Manager',
        coach: 'Coach',
        description: 'Descrizione',
        svgLogo: ImagesConstants.teamLogoImg,
        isHomeTeam: false
    ),
  ];

  List<String> textList = [
    'Tutte',
    'In casa',
    'In trasferta',
  ];
  List<bool> chipsSituation = [
    true,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        appBar: 2,
        goBack: () {context.pop();},
        paddingTop: 0,
        goHome: () {context.go(AppPage.homeSportsCenter.path);},
        title: getCurrentLanguageValue(TEAMS) ?? "",
        trailingIcon: Icons.home,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                newTeamButtonSection(),
                chipsSection(),
                Visibility(
                    visible: teams.isEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text14(
                        text: getCurrentLanguageValue(EMPTY_TEAMS_LIST) ?? "",
                      ),
                    )),
                ...teams.map((e) => teamsListSection(e)),
              ],
            ),
          ),
        ));
  }

  Widget teamsListSection(TeamEntity team) {
    return TeamCard(
      team: team,
      goToDetail: () {
        context.push(AppPage.teamDetail.path);
      },
    );
  }

  Widget newTeamButtonSection() {
    return Column(
      children: [
        ActionButton(
          onPressed: () {
            context.push(AppPage.addTeam.path);
          },
          text: getCurrentLanguageValue(ADD_TEAM) ?? "",
          backgroundColor: white,
          borderColor: textProfileGrey,
          rowLayout: false,
          height: 114,
          showPrefixIcon: true,
          textColor: textProfileGrey,
          svgPrefixIcon: ImagesConstants.addCircleImg,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: DividerWidget(),
        ),
      ],
    );
  }

  Widget chipsSection() {
    return ChoiceChipListWidget(
        chipsSituation: chipsSituation,
        textList: textList,
        changeSelection: (List<bool> value) {
          setState(() {
            chipsSituation = value;
          });
        });
  }
}
