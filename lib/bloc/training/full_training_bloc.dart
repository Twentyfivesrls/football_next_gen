import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/repository/training/training_service.dart';

class FullTrainingCubit extends Cubit<FullTrainingPageState> {

  FullTrainingCubit() : super(FullTrainingPageLoading());

  void fetchTraining(String id) async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(FullTrainingPageLoading());

    // fetch data
    try{
      TrainingEntity entity = await TrainingService().fetchTraining(id);
      emit(FullTrainingPageLoaded(training: entity));
    }catch(e){
      emit(FullTrainingPageError(error: e));
    }
  }
}

@immutable
class FullTrainingPageState{}
class FullTrainingPageLoading extends FullTrainingPageState{}
class FullTrainingPageLoaded extends FullTrainingPageState{
  TrainingEntity training;
  FullTrainingPageLoaded({required this.training});
}
class FullTrainingPageError extends FullTrainingPageState{
  dynamic error;
  FullTrainingPageError({required this.error});
}

