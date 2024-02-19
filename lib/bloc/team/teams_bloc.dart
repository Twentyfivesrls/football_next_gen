import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/team/team_service.dart';

class TeamsCubit extends Cubit<TeamsPageState> {

  TeamsCubit() : super(TeamsPageLoading());

  void fetchTeams() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(TeamsPageLoading());

    // fetch data
    try{
      List<TeamEntityDtoForList> entity = await TeamService().fetchTeamsList();
      emit(TeamsPageLoaded(teams: entity));
    }catch(e){
      emit(TeamsPageError(error: e));
    }
  }
}

@immutable
class TeamsPageState{}

class TeamsPageLoading extends TeamsPageState{}
class TeamsPageLoaded extends TeamsPageState{
  List<TeamEntityDtoForList> teams;
  TeamsPageLoaded({required this.teams});
}
class TeamsPageError extends TeamsPageState{
  dynamic error;
  TeamsPageError({required this.error});
}

