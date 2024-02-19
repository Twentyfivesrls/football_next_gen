import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/repository/tournaments/tournaments_service.dart';
import '../../models/tournament.dart';

class SingleTournamentCubit extends Cubit<SingleTournamentPageState> {

  SingleTournamentCubit() : super(SingleTournamentPageLoading());

  void fetchTournament(String id) async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(SingleTournamentPageLoading());

    // fetch data
    try{
      TournamentEntity entity = await TournamentsService().fetchTournament(id);
      emit(SingleTournamentPageLoaded(tournament: entity));
    }catch(e){
      emit(SingleTournamentPageError(error: e));
    }
  }
}

@immutable
class SingleTournamentPageState{}
class SingleTournamentPageLoading extends SingleTournamentPageState{}
class SingleTournamentPageLoaded extends SingleTournamentPageState{
  TournamentEntity tournament;
  SingleTournamentPageLoaded({required this.tournament});
}
class SingleTournamentPageError extends SingleTournamentPageState{
  dynamic error;
  SingleTournamentPageError({required this.error});
}

