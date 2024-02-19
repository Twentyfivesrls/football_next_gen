import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/tournaments/tournaments_bloc.dart';
import 'package:football_next_gen/constants/colors.dart';
import 'package:football_next_gen/constants/images_constants.dart';
import 'package:football_next_gen/constants/language.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/pages/sports_center/tournaments/widgets/tournament_card.dart';
import 'package:football_next_gen/widgets/buttons.dart';
import 'package:football_next_gen/widgets/divider.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/app_pages.dart';



class TournamentsList extends StatelessWidget{
  const TournamentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TournamentsCubit(),
      child: const TournamentsListWidget(),
    );
  }
}


class TournamentsListWidget extends StatefulWidget{
  const TournamentsListWidget({super.key});
  @override
  State<StatefulWidget> createState() => TournamentsListState();

}

class TournamentsListState extends State<TournamentsListWidget>{

  TournamentsCubit get _tournamentsCubit => context.read<TournamentsCubit>();

  @override
  void initState() {
    _tournamentsCubit.fetchTournaments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        appBar: 2,
        goBack: (){context.pop();},
        paddingTop: 0,
        goHome: (){context.go(AppPage.homeSportsCenter.path);},
        title: AppPage.tournamentsList.toTitle,
        trailingIcon: Icons.home,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: BlocBuilder<TournamentsCubit,TournamentsPageState>(
            builder: (_,state) {
              if(state is TournamentsPageLoading){
                return const Center(child: CircularProgressIndicator());
              }
              else if(state is TournamentsPageLoaded){
                return Column(
                  children: [
                    newTeamButtonSection(),
                    Visibility(
                        visible: state.tournaments.isEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text14(
                            text: getCurrentLanguageValue(EMPTY_TOURNAMENTS_LIST) ?? "",
                          ),
                        )
                    ),
                    ...state.tournaments.map((e) => tournamentsListSection(e)),
                  ],
                );
              }
              else{
                // here the state is error
                return Center(
                  child: Text18(
                    text: (state as TournamentsPageError).error.toString(),
                  ),
                );
              }
            }),
          ),
        )
    );
  }

  Widget tournamentsListSection(TournamentEntityDtoForList tournament){
    return TournamentCard(
      tournament:tournament,
      goToDetail: (){
        context.push(AppPage.tournamentDetail.path, extra: tournament.id);
      },
    );
  }

  Widget newTeamButtonSection(){
    return Column(
      children: [

        ActionButton(
          onPressed: (){
            context.push(AppPage.addTournament.path);
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