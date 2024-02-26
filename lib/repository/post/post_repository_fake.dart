import 'dart:io';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/models/tournament.dart';

class PostRepositoryFake {

  static final PostRepositoryFake _instance = PostRepositoryFake._internal();

  factory PostRepositoryFake() {
    return _instance;
  }

  PostRepositoryFake._internal();

  Future<List<PostEntityDtoForList>> fetchPostsList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<PostEntityDtoForList> result = [];
    for(int i = 0; i<10; i++){
      result.add(PostEntityDtoForList.defaultValue());
    }
    return Future.value(result);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }



  Future<PostEntity> fetchPost(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    return Future.value(PostEntity.defaultValue());
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}