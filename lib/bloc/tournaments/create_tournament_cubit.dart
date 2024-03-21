
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/repository/tournaments/tournaments_service.dart';



class CreateTournamentCubit extends Cubit<CreateTournamentState> {
  CreateTournamentCubit() : super(CreateTournamentState(tournamentEntity: TournamentEntity.emptyPost()));

  fetchCreatePost(TournamentEntity tournamentEntity)async{
    var result = await TournamentsService().fetchCreateTournament(tournamentEntity);
    emit(CreateTournamentState( tournamentEntity: result));

  }
}
@immutable
class CreateTournamentState {
  TournamentEntity tournamentEntity;
  CreateTournamentState({required this.tournamentEntity});
}

