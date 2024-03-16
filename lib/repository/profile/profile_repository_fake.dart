


import 'dart:io';

import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';

class ProfileRepositoryFake {

  static final ProfileRepositoryFake _instance = ProfileRepositoryFake._internal();

  factory ProfileRepositoryFake() {
    return _instance;
  }

  ProfileRepositoryFake._internal();


  Future<UserEntity> fetchProfile(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(UserEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

  Future<List<ProfileEntityDtoForList>> fetchProfileList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<ProfileEntityDtoForList> result = [];
    for(int i = 0; i<20; i++){
      result.add(ProfileEntityDtoForList.defaultValue(isChild: i%2 == 0));
    }
    return Future.value(result);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}