import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_next_gen/bloc/group/group_bloc.dart';
import 'package:football_next_gen/bloc/tournaments/single_tournament_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/group_card.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/tournament_info.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/images_constants.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/divider.dart';
import '../../../widgets/tabbar.dart';
import '../../../widgets/tabbar_view.dart';
import '../../../widgets/texts.dart';

class TournamentDetail extends StatelessWidget{

  final String tournamentId;
  const TournamentDetail({super.key, required this.tournamentId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SingleTournamentCubit(),
        ),
        BlocProvider(
          create: (_) => GroupCubit(),
        )
      ],
      child: TournamentDetailWidget(tournamentId: tournamentId),
    );
  }
}


class TournamentDetailWidget extends StatefulWidget{
  final String tournamentId;
  const TournamentDetailWidget({super.key, required this.tournamentId});

  @override
  State<StatefulWidget> createState() => TournamentDetailState();

}

class TournamentDetailState extends State<TournamentDetailWidget> with TickerProviderStateMixin{

  late final TabController tabController;
  SingleTournamentCubit get _tournamentCubit => context.read<SingleTournamentCubit>();
  GroupCubit get _groupCubit => context.read<GroupCubit>();
  int activeIndex = 0;

  final String category = 'Juniores (Under 18)';
  final String rules = 'Ogni partita consiste in due tempi da 45 minuti.Rigori in caso di pareggio alla fine dei tempi regolamentari.Massimo di 15 giocatori per squadra.Cartellino rosso diretto per comportamento antisportivo.';
  final String typology = 'Torneo ad eliminazione diretta';
  final String info = 'Il Torneo Calcio d\'Eccellenza è aperto a squadre giovanili di club e scuole calcio.Premi per la squadra vincitrice e il miglior giocatore.Il torneo si tiene presso gli impianti sportivi XYZ in data [data].';
  final String email = 'info@torneocalciodelleccellenza.com';
  final String phone = '+39 123 456 789';
  final String title = 'Torneo iper mega super incredibile - Under 19 - Cosenza';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    _tournamentCubit.fetchTournament(widget.tournamentId);
    _groupCubit.fetchGroup();
    print(widget.tournamentId);
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
          context.go(AppPage.homeSportsCenter.path);
        },
        goBack: (){
          context.go(AppPage.tournamentsList.path);
        },
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: TextH1(text: title),
                  ),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(ImagesConstants.editImg))
                  )
                ],
              ),
            ),

            TabBarWidget(
              tabController: tabController,
              activeIndex: activeIndex,
              tabs: <Widget>[
                Tab(
                  child: Text14(
                    text: 'Gironi',
                    fontWeight: activeIndex == 0 ? FontWeight.w600: FontWeight.w500,
                    textColor: activeIndex == 0 ? primary : textProfileGrey,
                  ),
                ),
                Tab(
                  child: Text14(
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
                  child: BlocBuilder<GroupCubit,GroupPageState>(
                     builder: (_,state) {
                       if (state is GroupPageLoading) {
                         return const Center(
                             child: CircularProgressIndicator());
                       }
                       else if (state is GroupPageLoaded) {
                         return Column(
                           children: [
                             newGroupsButtonSection(),
                             ...state.groups.map((e) => groupsListSection(e)),
                           ],
                         );
                       }
                       else{
                         // here the state is error
                         return Center(
                           child: Text18(
                             text: (state as GroupPageError).error.toString(),
                           ),
                         );
                       }
                     }
                    )
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
                context.push(AppPage.addGroup.path, extra: widget.tournamentId);
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

  Widget groupsListSection(GroupEntityDtoForList group){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GroupCard(
        group:group,
        name: group.groupName,
        goToDetail: (){
          context.push(AppPage.groupDetail.path, extra: {"id": group.id, "tournamentId": widget.tournamentId});
        },
      ),
    );
  }

}