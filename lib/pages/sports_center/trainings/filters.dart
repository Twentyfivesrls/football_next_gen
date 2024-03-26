import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/bloc/team/teams_bloc.dart';
import 'package:football_next_gen/constants/app_pages.dart';
import 'package:football_next_gen/widgets/scaffold.dart';
import 'package:football_next_gen/widgets/texts.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/colors.dart';
import '../../../constants/language.dart';
import '../../../models/team_entity.dart';
import '../../../widgets/autocomplete.dart';
import '../../../widgets/buttons.dart';

class Filters extends StatelessWidget{
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TeamsCubit(),
        )
      ],
      child: const FiltersWiget(),
    );
  }

}

class FiltersWiget extends StatefulWidget {
  const FiltersWiget({super.key});

  @override
  State<StatefulWidget> createState() => FiltersState();
}

class FiltersState extends State<FiltersWiget> {
  static const List<String> teamsList = <String>[
    'US Tigri Tuonanti',
    'AS Football Club',
    'Soccer Team FC',
  ];
  static const List<String> fieldsList = <String>[
    'Campo A1',
    'Campo A2',
    'Campo A3',
  ];
  List<TeamEntity> selectedTeams = [];
  List<TeamEntity> teamList = [];

  TeamsCubit get _teamsCubit => context.read<TeamsCubit>();

  void onTeamSelected(String selectedTeamName) {
    _teamsCubit.searchTeams(selectedTeamName);
  }

  @override
  void initState() {
    super.initState();
    _teamsCubit.fetchAllTeams();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: 2,
      paddingTop: 0,
      showFirstTrailingIcon: false,
      title: AppPage.filters.toTitle,
      firstTrailingIconOnTap: () {},
      secondTrailingIconOnTap: (){},
      goBack: () {},
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [buttonsSection()],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TeamsCubit,TeamsPageState>(
                builder: (_,state) {
                  if(state is TeamsPageLoading){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else if(state is TeamsPageLoaded){
                    teamList = state.teams; // Aggiorna la lista dei team con i dati ottenuti dal bloc
                    List<String> teamNames = teamList.map((team) => team.name).toList(); // Estrai i nomi delle squadre
                    return Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AutocompleteWidget(
                        kOptions: teamNames,
                        hintText: 'Seleziona squadra/e',
                        labelText: getCurrentLanguageValue(TEAM) ?? "",
                        
                      ),
                    );
                  }else{
                    // here the state is error
                    return Center(
                      child: Text18(
                        text: (state as TeamsPageError).error.toString(),
                      ),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: AutocompleteWidget(
                kOptions: fieldsList,
                hintText: 'Seleziona campo/i',
                labelText: getCurrentLanguageValue(FIELD) ?? "",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
            onTap: (){
              setState(() {
              });
            },
            child: Text14(
              text: getCurrentLanguageValue(FILTERS_RESET) ?? "",
              underline: true,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ActionButton(
          onPressed: () {
            context.pop();
          },
          text: getCurrentLanguageValue(APPLY) ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ActionButton(
            onPressed: () {
              context.pop();
            },
            text: getCurrentLanguageValue(CANCEL) ?? "",
            backgroundColor: cancelGrey,
            borderColor: cancelGrey,
          ),
        )
      ],
    );
  }
}
