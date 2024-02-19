import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/repository/training/training_service.dart';

class TrainingsCubit extends Cubit<TrainingsPageState> {

  TrainingsCubit() : super(TrainingsPageLoading());

  void fetchTrainings() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(TrainingsPageLoading());

    // fetch data
    try{
      List<TrainingEntityDtoForList> entity = await TrainingService().fetchTrainingsList();
      emit(TrainingsPageLoaded(trainings: entity));
    }catch(e){
      emit(TrainingsPageError(error: e));
    }
  }
}

@immutable
class TrainingsPageState{}

class TrainingsPageLoading extends TrainingsPageState{}
class TrainingsPageLoaded extends TrainingsPageState{
  List<TrainingEntityDtoForList> trainings;
  TrainingsPageLoaded({required this.trainings});
}
class TrainingsPageError extends TrainingsPageState{
  dynamic error;
  TrainingsPageError({required this.error});
}

