import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';

class TeamRepository {

  static final TeamRepository _instance = TeamRepository._internal();

  factory TeamRepository() {
    return _instance;
  }

  TeamRepository._internal();

  String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';


  Future<TeamEntity> createTeam(TeamEntity teamEntity) async {
    try {
      Response response = await KeycloakRepository().httpClient!.post(
          '$baseUrl/team/createTeam', data: teamEntity.toJson());
      if (response.statusCode == 200) {
        TeamEntity teamEntity = TeamEntity.fromJson(response.data);
        return teamEntity;
      } else {
        throw Exception('Failed to update post: ${response.statusCode}');
      }
    } catch (e) {
      print("Error updating post: $e");
      throw e;
    }
  }

  Future<List<TeamEntity>> getAllTeam()async{
    var response = await KeycloakRepository().httpClient!.get('$baseUrl/team/getAllTeam');
    List<TeamEntity> teamList = (response.data as List).map((teams) => TeamEntity.fromJson(teams)).toList();
    return teamList;
  }

  Future<TeamEntity> getTeamById(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/team/getTeamById/$id');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        TeamEntity post = TeamEntity.fromJson(response.data);
        return post;
      } else {
        throw Exception('Failed to fetch post by ID: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching post by ID: $e");
      throw e;
    }
  }

}