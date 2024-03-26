import 'dart:async';
import 'dart:io';
import 'package:football_next_gen/models/autocomplete_entity.dart';
import 'package:football_next_gen/models/team_entity.dart';

class TeamRepositoryFake {

  static final TeamRepositoryFake _instance = TeamRepositoryFake._internal();

  factory TeamRepositoryFake() {
    return _instance;
  }

  TeamRepositoryFake._internal();

  Future<List<TeamEntity>> fetchTeamsList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<TeamEntity> result = [];
    for(int i = 0; i<10; i++){
      result.add(TeamEntity.defaultValue(isHome: i%2 == 0));
    }
    return Future.value(result);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }
  Future<List<AutocompleteEntity>> fetchAutocompleteTeamsList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<TeamEntity> result = [];
    for(int i = 0; i<10; i++){
      result.add(TeamEntity.defaultValue(isHome: i%2 == 0));
    }
    return Future.value(result as FutureOr<List<AutocompleteEntity>>?);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }


  Future<TeamEntity> fetchTeam(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(TeamEntity.defaultValue(isHome: true));
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

  Future<TeamEntity> fetchCreateTeam(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(TeamEntity.defaultValue(isHome: true));
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}