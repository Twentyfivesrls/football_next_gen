import 'package:dio/dio.dart';
import 'package:football_next_gen/models/profile_entity.dart';



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


  Future <ProfileEntity> getUserProfile(int id) async{
    var response =  await httpClient!.get('$baseUrl/profile/getProfile/$id');
    ProfileEntity result = ProfileEntity.fromJson(response.data);
    print("STAMPO RESULT");
    print(result);
    return result;
  }


}