import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/group/group_bloc.dart';
import 'package:football_next_gen/bloc/tournaments/single_tournament_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/models/tournament.dart';
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

  final int tournamentId;
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
  final int tournamentId;
  const TournamentDetailWidget({super.key, required this.tournamentId});

  @override
  State<StatefulWidget> createState() => TournamentDetailState();

}

class TournamentDetailState extends State<TournamentDetailWidget> with TickerProviderStateMixin{

  late final TabController tabController;
  SingleTournamentCubit get _tournamentCubit => context.read<SingleTournamentCubit>();
  GroupCubit get _groupCubit => context.read<GroupCubit>();
  int activeIndex = 0;

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
        firstTrailingIcon: Icons.home,
        paddingTop: 0,
        paddingLeft: 0,
        paddingRight: 0,
        firstTrailingIconOnTap: (){
          context.go(AppPage.homeSportsCenter.path);
        },
        secondTrailingIconOnTap: (){},
        goBack: (){
          context.go(AppPage.tournamentsList.path);
        },
        body:  BlocBuilder<SingleTournamentCubit,SingleTournamentPageState>(
            builder: (_,state) {
              if (state is SingleTournamentPageLoading) {
                return const Center(
                    child: CircularProgressIndicator());
              }
              else if (state is SingleTournamentPageLoaded) {
                return content(state.tournament);
              }   else{
                // here the state is error
                return Center(
                  child: Text18(
                    text: (state as SingleTournamentPageError).error.toString(),
                  ),
                );
              }
            }),
    );
  }


  Widget content(TournamentEntity tournament){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
          child: TextH1(text: tournament.name),
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

                              Visibility(
                                  visible: state.groups.isEmpty,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text18(
                                      text: getCurrentLanguageValue(EMPTY_GROUPS_LIST) ?? "",
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                              ),


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
                    edit: () {
                      context.push(AppPage.addTournament.path, extra: true);
                    },
                    tournament: tournament,
                  )
              )
          ),
        ),
      ],
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
                context.push(AppPage.addGroup.path, extra: {"id" : widget.tournamentId, "edit" : false});
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

  Widget groupsListSection(GroupEntity group){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GroupCard(
        deleteGroup: (){},
        editGroup: (){
          context.push(AppPage.addGroup.path, extra:  {"id" : widget.tournamentId, "edit" : true});
        },
        group:group,
        name: group.groupName,
        goToDetail: (){
          context.push(AppPage.groupDetail.path, extra: {"id": group.id, "tournamentId": widget.tournamentId, "name" : group.groupName});
        },
      ),
    );
  }

}