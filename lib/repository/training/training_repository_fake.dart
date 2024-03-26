import 'dart:io';
import 'package:football_next_gen/models/training_entity.dart';

class TrainingRepositoryFake {

  static final TrainingRepositoryFake _instance = TrainingRepositoryFake._internal();

  factory TrainingRepositoryFake() {
    return _instance;
  }

  TrainingRepositoryFake._internal();

  Future<List<TrainingEntity>> fetchTrainingsList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<TrainingEntity> result = [];
    for(int i = 0; i<10; i++){
      result.add(TrainingEntity.defaultValue());
    }
    return Future.value(result);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }


  Future<TrainingEntity> fetchTraining(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(TrainingEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}