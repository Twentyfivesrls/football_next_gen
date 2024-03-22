
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/repository/match/match_service.dart';


class CreateMatchCubit extends Cubit<CreateMatchState> {
  CreateMatchCubit() : super(CreateMatchState(matchEntity: MatchEntity.emptyMatch()));

  fetchCreatePost(MatchEntity matchEntity)async{
    var result = await MatchService().fetchCreateMatch(matchEntity);
    emit(CreateMatchState( matchEntity: result));

  }
}
@immutable
class CreateMatchState {
  MatchEntity matchEntity;
  CreateMatchState({required this.matchEntity});
}

