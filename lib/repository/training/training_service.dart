import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/repository/training/training_repository.dart';
import 'package:football_next_gen/repository/training/training_repository_fake.dart';

class TrainingService {

  static final TrainingService _instance = TrainingService._internal();

  factory TrainingService() {
    return _instance;
  }

  TrainingService._internal();

  Future <List<TrainingEntity>> fetchTrainingsList(){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return TrainingRepository().getAllTrainings();
    }else{
      return TrainingRepositoryFake().fetchTrainingsList();
    }
  }

  Future<TrainingEntity> fetchTraining(int id){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return TrainingRepository().getTrainingById(id);
    }else{
      return TrainingRepositoryFake().fetchTraining();
    }
  }

  Future<TrainingEntity> fetchCreateTraining(TrainingEntity trainingEntity){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return TrainingRepository().createTraining(trainingEntity);
    }else{
      return TrainingRepositoryFake().fetchTraining();
    }
  }

  Future<void> fetchDeleteTraining(int id){
    if(GlobalConstants.sportsCenterProfileReal){
      return TrainingRepository().deleteTraining(id);
    }else{
      return TrainingRepositoryFake().fetchTraining();
    }
  }

  Future<List<TrainingEntity>> fetchGetTrainingsByDate (DateTime date){
    if(GlobalConstants.sportsCenterProfileReal){
      return TrainingRepository().getTrainingsByDate(date);
    }else{
      return TrainingRepositoryFake().fetchTrainingsList();
    }
  }

}
