import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/repository/match/match_service.dart';

class MatchCubit extends Cubit<MatchPageState> {

  MatchCubit() : super(MatchPageLoading());

  void fetchMatch() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(MatchPageLoading());

    // fetch data
    try{
      List<MatchEntity> entity = await MatchService().fetchMatches();
      emit(MatchPageLoaded(matches: entity));
    }catch(e){
      emit(MatchPageError(error: e));
    }
  }
}


@immutable
class MatchPageState{}

class MatchPageLoading extends MatchPageState{}
class MatchPageLoaded extends MatchPageState{
  List<MatchEntity> matches;
  MatchPageLoaded({required this.matches});
}
class MatchPageError extends MatchPageState{
  dynamic error;
  MatchPageError({required this.error});
}

