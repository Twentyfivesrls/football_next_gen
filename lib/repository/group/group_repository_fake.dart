import 'dart:io';
import 'package:football_next_gen/models/group_entity.dart';

class GroupRepositoryFake {

  static final GroupRepositoryFake _instance = GroupRepositoryFake._internal();

  factory GroupRepositoryFake() {
    return _instance;
  }

  GroupRepositoryFake._internal();


  Future<GroupEntityDtoForList> fetchGroupsList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(GroupEntityDtoForList.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

  Future<GroupEntity> fetchGroup(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(GroupEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}