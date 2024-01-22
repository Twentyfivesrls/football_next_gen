import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/single_match.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../constants/language.dart';
import '../../../models/match_entity.dart';
import '../../../widgets/buttons.dart';

class GroupDetail extends StatefulWidget {
  const GroupDetail({super.key});
  @override
  State<StatefulWidget> createState() => GroupDetailState();
}

class GroupDetailState extends State<GroupDetail> {

  final String groupTitle = 'Girone 1';
  final String matchTitle = 'Partita 1';
  final List<MatchEntity> matches = [
    MatchEntity(homeTeam: 'homeTeam',
        awayTeam: 'awayTeam',
        place: 'place',
        date: 'date',
        hour: 'hour',
        title: 'Partita 1'
    ),
    MatchEntity(homeTeam: 'homeTeam',
        awayTeam: 'awayTeam',
        place: 'place',
        date: 'date',
        hour: 'hour',
        title: 'Partita 2'
    ),
    MatchEntity(homeTeam: 'homeTeam',
        awayTeam: 'awayTeam',
        place: 'place',
        date: 'date',
        hour: 'hour',
        title: 'Partita 3'
    ),
    MatchEntity(
        homeTeam: 'homeTeam',
        awayTeam: 'awayTeam',
        place: 'place',
        date: 'date',
        hour: 'hour',
        title: 'Partita 4'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 3,
      paddingRight: 0,
      paddingLeft: 0,
      paddingTop: 0,
      showTrailingIcon: true,
      title: AppPage.groupDetail.toTitle,
      trailingIcon: Icons.home,
      goHome: () {
        context.go(AppPage.homeSportsCenter.path);
      },
      goBack: () {
        context.push(AppPage.tournamentDetail.path);
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            titleSection(),
            ...matches.map((e) => matchListSection(e)),
            newMatchButtonSection()
          ],
        ),
      ),
    );
  }

  Widget matchListSection(MatchEntity match) {
    return SingleMatch(
      match: match,
      title: matchTitle,
    );
  }

  Widget titleSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: TextH1(text: groupTitle),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: DividerWidget(),
        )
      ],
    );
  }

  Widget newMatchButtonSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ActionButton(
        onPressed: (){},
        text: getCurrentLanguageValue(ADD_MATCH) ?? "",
        backgroundColor: white,
        borderColor: textProfileGrey,
        rowLayout: false,
        height: 114,
        showPrefixIcon: true,
        textColor: textProfileGrey,
        svgPrefixIcon: ImagesConstants.addCircleImg,
      ),
    );
  }
}