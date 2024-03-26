import 'package:dio/dio.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';

class MatchRepository {

  static final MatchRepository _instance = MatchRepository._internal();

  factory MatchRepository() {
    return _instance;
  }

  MatchRepository._internal();

   String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';
  //String baseUrl = 'http://localhost:8080';

  Future<List<MatchEntity>> getAllMatch()async{
    Response response;
    response = await KeycloakRepository().httpClient!.get('$baseUrl/match/getAllMatch');
    List<MatchEntity> matchList = (response.data as List).map((matches) => MatchEntity.fromJson(matches)).toList();
    return matchList;
  }

  Future<MatchEntity> createMatch(MatchEntity matchEntity) async{
    try {
      Response response =  await KeycloakRepository().httpClient!.post('$baseUrl/match/createMatch', data: matchEntity.toJson());
      if (response.statusCode == 200) {
        MatchEntity matchEntity = MatchEntity.fromJson(response.data);
        return matchEntity;
      } else {
        throw Exception('Failed to update post: ${response.statusCode}');
      }
    } catch (e) {
      print("Error updating post: $e");
      throw e;
    }
  }



  Future<MatchEntity> getMatchesByGroupId(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/match/getMatchesByGroupId/$id');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        MatchEntity match = MatchEntity.fromJson(response.data);
        return match;
      } else {
        throw Exception('Failed to fetch post by ID: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching post by ID: $e");
      throw e;
    }
  }


}