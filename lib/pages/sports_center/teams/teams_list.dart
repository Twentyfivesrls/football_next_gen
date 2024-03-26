import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/team/teams_bloc.dart';
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

class TeamsList extends StatelessWidget{
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeamsCubit(),
      child: const TeamsListWidget(),
    );
  }
}

class TeamsListWidget extends StatefulWidget {
  const TeamsListWidget({super.key});
  @override
  State<StatefulWidget> createState() => TeamListState();
}

class TeamListState extends State<TeamsListWidget> {
  TeamsCubit get _teamsCubit => context.read<TeamsCubit>();
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
  void initState() {
    _teamsCubit.fetchAllTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        appBar: 2,
        goBack: () {context.pop();},
        paddingTop: 0,
        firstTrailingIconOnTap: () {context.go(AppPage.homeSportsCenter.path);},
        secondTrailingIconOnTap: (){},
        title: getCurrentLanguageValue(TEAMS) ?? "",
        firstTrailingIcon: Icons.home,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child:  BlocBuilder<TeamsCubit,TeamsPageState>(
              builder: (_,state) {
                if(state is TeamsPageLoading){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(state is TeamsPageLoaded){
                 return Column(
                    children: [
                      newTeamButtonSection(),
                      chipsSection(),
                      Visibility(
                          visible: state.teams.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text18(
                              text: getCurrentLanguageValue(EMPTY_TEAMS_LIST) ?? "",
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      ...state.teams.map((e) => teamsListSection(e)),
                    ],
                  );
                }
                else{
                  // here the state is error
                  return Center(
                    child: Text18(
                      text: (state as TeamsPageError).error.toString(),
                    ),
                  );
                }
              }
            ),
          ),
        ));
  }

  Widget teamsListSection(TeamEntity team) {
    return TeamCard(
      team: team,
      goToDetail: () {
        context.push(AppPage.teamDetail.path, extra: {"id": team.id, "isHome": team.isHomeTeam} );
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
