


import 'dart:io';
import 'package:football_next_gen/models/child_profile_entity.dart';

class ChildProfileRepositoryFake {

  static final ChildProfileRepositoryFake _instance = ChildProfileRepositoryFake._internal();

  factory ChildProfileRepositoryFake() {
    return _instance;
  }

  ChildProfileRepositoryFake._internal();


  Future<ChildProfileEntity> fetchChildProfile(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(ChildProfileEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }


}