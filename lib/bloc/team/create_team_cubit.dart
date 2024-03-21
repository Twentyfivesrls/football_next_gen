
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/team/team_service.dart';



class CreateTeamCubit extends Cubit<CreateTeamState> {
  CreateTeamCubit() : super(CreateTeamState(teamEntity: TeamEntity.emptyPost()));

  fetchCreatePost(TeamEntity teamEntity)async{
    var result = await TeamService().fetchCreateTeam(teamEntity);
    emit(CreateTeamState( teamEntity: result));

  }
}
@immutable
class CreateTeamState {
  TeamEntity teamEntity;
  CreateTeamState({required this.teamEntity});
}

