import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/repository/match/match_service.dart';
import 'package:football_next_gen/repository/tournaments/tournaments_service.dart';
import '../../models/tournament.dart';

class SingleMatchCubit extends Cubit<SingleMatchPageState> {

  SingleMatchCubit() : super(SingleMatchPageLoading());

  void fetchMatch(int id) async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(SingleMatchPageLoading());

    // fetch data
    try{
      MatchEntity matchEntity = await MatchService().fetchGetMatch(id);
      emit(SingleMatchPageLoaded(matchEntity: matchEntity));
    }catch(e){
      emit(SingleMatchPageError(error: e));
    }
  }
}

@immutable
class SingleMatchPageState{}
class SingleMatchPageLoading extends SingleMatchPageState{}
class SingleMatchPageLoaded extends SingleMatchPageState{
  MatchEntity matchEntity;
  SingleMatchPageLoaded({required this.matchEntity});
}
class SingleMatchPageError extends SingleMatchPageState{
  dynamic error;
  SingleMatchPageError({required this.error});
}

