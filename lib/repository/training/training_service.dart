import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/training_entity.dart';
import 'package:football_next_gen/repository/training/training_repository_fake.dart';

class TrainingService {

  static final TrainingService _instance = TrainingService._internal();

  factory TrainingService() {
    return _instance;
  }

  TrainingService._internal();

  Future <List<TrainingEntityDtoForList>> fetchTrainingsList(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return TrainingRepositoryFake().fetchTrainingsList();
    }
  }

  Future<TrainingEntity> fetchTraining(String id){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value(TrainingEntity.defaultValue());
    }else{
      return TrainingRepositoryFake().fetchTraining();
    }
  }

}
