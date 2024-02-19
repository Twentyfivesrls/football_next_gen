


import 'dart:io';

import 'package:football_next_gen/models/profile_entity.dart';

class ProfileRepositoryFake {

  static final ProfileRepositoryFake _instance = ProfileRepositoryFake._internal();

  factory ProfileRepositoryFake() {
    return _instance;
  }

  ProfileRepositoryFake._internal();


  Future<ProfileEntity> fetchProfile(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(ProfileEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }


}