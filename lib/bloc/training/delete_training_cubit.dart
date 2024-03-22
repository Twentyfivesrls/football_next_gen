
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/repository/training/training_service.dart';



class DeleteTrainingCubit extends Cubit<DeleteTrainingState> {
  DeleteTrainingCubit() : super(DeleteTrainingState());

  void fetchDeletePost(int id) async {
    // Invia uno stato di caricamento prima di eliminare il post
    emit(DeleteTrainingPageLoading());

    try {
      // Elimina il post
      await TrainingService().fetchDeleteTraining(id);
      // Invia uno stato di eliminazione avvenuta con successo
      emit(DeleteTrainingLoaded());
    } catch (e) {
      // Se si verifica un errore, invia uno stato di errore
      emit(DeleteTrainingError(error: e));
    }
  }
}
@immutable
class DeleteTrainingState {}
class DeleteTrainingPageLoading extends DeleteTrainingState {}
class DeleteTrainingLoaded  extends DeleteTrainingState {}
class DeleteTrainingError  extends DeleteTrainingState {
  dynamic error;
  DeleteTrainingError({required this.error});
}

