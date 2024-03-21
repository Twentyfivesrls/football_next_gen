import 'dart:io';
import 'package:football_next_gen/models/tournament.dart';

class TournamentsRepositoryFake {

  static final TournamentsRepositoryFake _instance = TournamentsRepositoryFake._internal();

  factory TournamentsRepositoryFake() {
    return _instance;
  }

  TournamentsRepositoryFake._internal();

  Future<List<TournamentEntity>> fetchTournamentsList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<TournamentEntity> result = [];
    for(int i = 0; i<10; i++){
      result.add(TournamentEntity.defaultValue());
    }
    return Future.value(result);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }



  Future<TournamentEntity> fetchTournament(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(TournamentEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }
  Future<TournamentEntity> fetchCreateTournament(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(TournamentEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}