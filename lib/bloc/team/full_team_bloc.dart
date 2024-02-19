import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/team/team_service.dart';

class FullTeamCubit extends Cubit<FullTeamPageState> {

  FullTeamCubit() : super(FullTeamPageLoading());

  void fetchTournament(String id) async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(FullTeamPageLoading());

    // fetch data
    try{
      TeamEntity entity = await TeamService().fetchTeam(id);
      emit(FullTeamPageLoaded(team: entity));
    }catch(e){
      emit(FullTeamPageError(error: e));
    }
  }
}

@immutable
class FullTeamPageState{}
class FullTeamPageLoading extends FullTeamPageState{}
class FullTeamPageLoaded extends FullTeamPageState{
  TeamEntity team;
  FullTeamPageLoaded({required this.team});
}
class FullTeamPageError extends FullTeamPageState{
  dynamic error;
  FullTeamPageError({required this.error});
}

