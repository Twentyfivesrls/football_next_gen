import 'package:dio/dio.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';



class ProfileRepository {

  static final ProfileRepository _instance = ProfileRepository._internal();

  factory ProfileRepository() {
    return _instance;
  }

  ProfileRepository._internal();

  Dio? httpClient;

  init() {
    httpClient = Dio();
  }

  String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';


  Future <UserEntity> getUserProfile(String username) async{
    var response =  await httpClient!.get('$baseUrl/utente/getUserFromUsername?username=$username');
    UserEntity result = UserEntity.fromJson(response.data);
    print(result);
    return result;
  }


}