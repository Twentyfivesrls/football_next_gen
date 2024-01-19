import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/pages/sports_center/teams/widgets/team_card.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';
import '../../../models/team_entity.dart';

class TeamsList extends StatefulWidget{
  const TeamsList({super.key});
  @override
  State<StatefulWidget> createState() => TeamListState();

}

class TeamListState extends State<TeamsList>{

  var teams = [
    TeamEntity(name: 'FC Eggbird', manager: 'dwqqdq', coach: 'wdw', description: 'rvdff', svgLogo: ImagesConstants.teamLogoImg),
    TeamEntity(name: 'AS Piedi', manager: 'qwdqw', coach: 'wqwa', description: 'egg',svgLogo: ImagesConstants.teamLogoImg),
    TeamEntity(name: 'Gro Gro', manager: 'wdqd', coach: 'qfqef',  description: 'safg',svgLogo: ImagesConstants.teamLogoImg),
    TeamEntity(name: 'Gro Gro', manager: 'wdqd', coach: 'qfqef',  description: 'safg',svgLogo: ImagesConstants.teamLogoImg),
  ];


  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        appBar: 2,
        goBack: (){
          context.pop();
        },
        paddingTop: 0,
        goHome: (){
          GoRouter.of(context).go(AppPage.homeSportsCenter.path);
        },
        title: getCurrentLanguageValue(TEAMS) ?? "",
        trailingIcon: Icons.home,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                newTeamButtonSection(),
                Visibility(
                    visible: teams.isEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text16(
                        text: getCurrentLanguageValue(EMPTY_TEAMS_LIST) ?? "",
                      ),
                    )
                ),
                ...teams.map((e) => teamsListSection(e)),
              ],
            ),
          ),
        )
    );
  }

  Widget teamsListSection(TeamEntity team){
    return TeamCard(
      team:team,
      goToDetail: (){
        GoRouter.of(context).push(AppPage.teamDetail.path);
      },
    );
  }

  Widget newTeamButtonSection(){
    return Column(
      children: [

        ActionButton(
          onPressed: (){
            GoRouter.of(context).push(AppPage.addTeam.path);
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
          padding: EdgeInsets.only(top: 30),
          child: DividerWidget(),
        ),
      ],
    );
  }
}