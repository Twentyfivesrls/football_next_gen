import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/tournament.dart';
import '../../repository/tournaments/tournaments_service.dart';

class TournamentsCubit extends Cubit<TournamentsPageState> {

  TournamentsCubit() : super(TournamentsPageLoading());

  void fetchTournaments() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(TournamentsPageLoading());

    // fetch data
    try{
      List<TournamentEntityDtoForList> entity = await TournamentsService().fetchTournamentsList();
      emit(TournamentsPageLoaded(tournaments: entity));
    }catch(e){
      emit(TournamentsPageError(error: e));
    }
  }
}

@immutable
class TournamentsPageState{}

class TournamentsPageLoading extends TournamentsPageState{}
class TournamentsPageLoaded extends TournamentsPageState{
  List<TournamentEntityDtoForList> tournaments;
  TournamentsPageLoaded({required this.tournaments});
}
class TournamentsPageError extends TournamentsPageState{
  dynamic error;
  TournamentsPageError({required this.error});
}

