
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/repository/training/training_service.dart';



class CreateTrainingCubit extends Cubit<CreateTrainingState> {
  CreateTrainingCubit() : super(CreateTrainingState(trainingEntity: TrainingEntity.emptyTraining()));

  fetchCreateTraining(TrainingEntity trainingEntity) async {
      var result = await TrainingService().fetchCreateTraining(trainingEntity);
      print(result);
      emit(CreateTrainingState(trainingEntity: result));
    }
  }

@immutable
class CreateTrainingState {
  TrainingEntity trainingEntity;
  CreateTrainingState({required this.trainingEntity});
}

