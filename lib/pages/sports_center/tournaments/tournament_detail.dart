import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widget/groups_list.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widget/tournament_info.dart';
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
  final String category = 'Juniores (Under 18)';
  final String rules = 'Ogni partita consiste in due tempi da 45 minuti.Rigori in caso di pareggio alla fine dei tempi regolamentari.Massimo di 15 giocatori per squadra.Cartellino rosso diretto per comportamento antisportivo.';
  final String typology = 'Torneo ad eliminazione diretta';
  final String info = 'Il Torneo Calcio d\'Eccellenza è aperto a squadre giovanili di club e scuole calcio.Premi per la squadra vincitrice e il miglior giocatore.Il torneo si tiene presso gli impianti sportivi XYZ in data [data].';
  final String email = 'info@torneocalciodelleccellenza.com';
  final String phone = '+39 123 456 789';

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
        paddingLeft: 0,
        paddingRight: 0,
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
                  secondTab: SingleChildScrollView(
                    child: TournamentInfo(
                        edit: (){},
                        category: category,
                        typology: typology,
                        rules: rules,
                        info: info,
                        email: email,
                        phone: phone
                    ),
                  )
              ),
            ),
          ],
        )
    );
  }



  Widget newGroupsButtonSection(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
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
      ),
    );
  }

}