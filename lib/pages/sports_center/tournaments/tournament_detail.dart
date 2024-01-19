import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widget/groups_list.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/tabbar.dart';
import '../../../widgets/tabbar_view.dart';
import '../../../widgets/texts.dart';

class TournamentDetail extends StatefulWidget{
  const TournamentDetail({super.key});

  @override
  State<StatefulWidget> createState() => TournamentDetailState();

}

class TournamentDetailState extends State<TournamentDetail> with TickerProviderStateMixin{

  late final TabController tabController;
  int activeIndex = 0;
  var groups = [
    GroupEntity(),
    GroupEntity(),
    GroupEntity(),
    GroupEntity(),
    GroupEntity(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        activeIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        appBar: 3,
        title: getCurrentLanguageValue(TOURNAMENT_DETAIL) ?? "",
        trailingIcon: Icons.home,
        paddingTop: 0,
        goHome: (){
          GoRouter.of(context).go(AppPage.homeSportsCenter.path);
        },
        goBack: (){
          context.go(AppPage.tournamentsList.path);
        },
        body: Column(
          children: [
            TabbarWidget(
              tabController: tabController,
              activeIndex: activeIndex,
              tabs: <Widget>[
                Tab(
                  child: Text16(
                    text: 'Gironi',
                    fontWeight: activeIndex == 0 ? FontWeight.w600: FontWeight.w500,
                    textColor: activeIndex == 0 ? primary : textProfileGrey,
                  ),
                ),
                Tab(
                  child: Text16(
                    text: 'Informazioni',
                    fontWeight: activeIndex == 1 ? FontWeight.w600: FontWeight.w500,
                    textColor: activeIndex == 1 ? primary : textProfileGrey,
                  ),
                ),
              ],

            ),

            Expanded(
              child: TabbarViewWidget(
                  tabController: tabController,
                  firstTab: SingleChildScrollView(
                    child: Column(
                      children: [

                        newGroupsButtonSection(),

                        GroupsList(groups: groups)
                      ],
                    ),
                  ),
                  secondTab: const Column(
                    children: [
                      Center(child: Text('egg'),)
                    ],
                  )
              ),
            ),
          ],
        )
    );
  }



  Widget newGroupsButtonSection(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ActionButton(
            onPressed: (){
              GoRouter.of(context).push(AppPage.addTournament.path);
            },
            text: getCurrentLanguageValue(ADD_GROUPS) ?? "",
            backgroundColor: white,
            borderColor: textProfileGrey,
            rowLayout: false,
            height: 114,
            showPrefixIcon: true,
            textColor: textProfileGrey,
            svgPrefixIcon: ImagesConstants.addCircleImg,
          ),
        ),

        const DividerWidget(),
      ],
    );
  }

}