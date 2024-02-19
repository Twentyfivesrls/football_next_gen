import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/sport.dart';
import '../../repository/profile/sport_service.dart';

class SportCubit extends Cubit<SportPageState> {

  SportCubit() : super(SportPageLoading());
  void fetchUserSports() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(SportPageLoading());

    // fetch data
    try{
      List<SportEntity> entity = await SportService().fetchSports();
      emit(SportPageLoaded(sports: entity));
    }catch(e){
      emit(SportPageError(error: e));
    }
  }
}

@immutable
class SportPageState{}

class SportPageLoading extends SportPageState{}
class SportPageLoaded extends SportPageState{
  List<SportEntity> sports;
  SportPageLoaded({required this.sports});
}
class SportPageError extends SportPageState{
  dynamic error;
  SportPageError({required this.error});
}

