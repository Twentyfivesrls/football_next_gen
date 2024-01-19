import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widget/tournament_card.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';

class TournamentsList extends StatefulWidget{
  const TournamentsList({super.key});
  @override
  State<StatefulWidget> createState() => TournamentsListState();

}

class TournamentsListState extends State<TournamentsList>{

  var teams = [
   TournamentEntity(
       typology: 'typology',
       category: 'category',
       phone: 'phone',
       email: 'email',
       rules: 'rules',
       info: 'info',
       poster: 'poster',
       name: 'Torneo Stellaris - Under 19'
   ),
    TournamentEntity(
        typology: 'typology',
        category: 'category',
        phone: 'phone',
        email: 'email',
        rules: 'rules',
        info: 'info',
        poster: 'poster',
        name: 'Torneo Stellaris - Under 19'
    ),
    TournamentEntity(
        typology: 'typology',
        category: 'category',
        phone: 'phone',
        email: 'email',
        rules: 'rules',
        info: 'info',
        poster: 'poster',
        name: 'Torneo Stellaris - Under 19'
    ),
    TournamentEntity(
        typology: 'typology',
        category: 'category',
        phone: 'phone',
        email: 'email',
        rules: 'rules',
        info: 'info',
        poster: 'poster',
        name: 'Torneo Stellaris - Under 19'
    ),
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
        title: AppPage.tournamentsList.toTitle,
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
                        text: getCurrentLanguageValue(EMPTY_TOURNAMENTS_LIST) ?? "",
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

  Widget teamsListSection(TournamentEntity tournament){
    return TournamentCard(
      tournament:tournament,
      goToDetail: (){
        GoRouter.of(context).push(AppPage.tournamentDetail.path);
      },
    );
  }

  Widget newTeamButtonSection(){
    return Column(
      children: [

        ActionButton(
          onPressed: (){
            GoRouter.of(context).push(AppPage.addTournament.path);
          },
          text: getCurrentLanguageValue(ADD_TOURNAMENT) ?? "",
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