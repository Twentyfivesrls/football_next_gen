import 'dart:io';
import 'package:football_next_gen/models/match_entity.dart';

class MatchRepositoryFake {

  static final MatchRepositoryFake _instance = MatchRepositoryFake._internal();

  factory MatchRepositoryFake() {
    return _instance;
  }

  MatchRepositoryFake._internal();


  Future<List<MatchEntity>> fetchMatches(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<MatchEntity> result = [];
    for(int i = 0; i<5; i++){
      result.add(MatchEntity.defaultValue());
    }
    return Future.value(result);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }


}