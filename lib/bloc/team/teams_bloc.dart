import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/autocomplete_entity.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/team/team_service.dart';

class TeamsCubit extends Cubit<TeamsPageState> {

  TeamsCubit() : super(TeamsPageLoading());

  void fetchAllTeams({bool? isHomeTeam}) async {
    emit(TeamsPageLoading());

    try {
      List<TeamEntity> entity = await TeamService().fetchTeamsList(isHomeTeam: isHomeTeam);
      emit(TeamsPageLoaded(teams: entity));
    } catch (e) {
      emit(TeamsPageError(error: e));
    }
  }



  void searchTeams(String searchValue) async {
    emit(TeamsPageLoading());
    try {
      List<AutocompleteEntity> searchResults = await TeamService().fetchSearchTeam(searchValue);
      print("Autocomplete Team:    $searchResults");
      emit(TeamsPageLoaded(teams: searchResults.map((result) => TeamEntity(id: result.id, name: result.value)).toList()));
    } catch (e) {
      emit(TeamsPageError(error: e));
    }
  }
}

@immutable
class TeamsPageState{}

class TeamsPageLoading extends TeamsPageState{}
class TeamsPageLoaded extends TeamsPageState{
  List<TeamEntity> teams;
  TeamsPageLoaded({required this.teams});
}
class TeamsPageError extends TeamsPageState{
  dynamic error;
  TeamsPageError({required this.error});
}

