import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:football_next_gen/models/autocomplete_entity.dart';

import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';

class TeamRepository {

  static final TeamRepository _instance = TeamRepository._internal();

  factory TeamRepository() {
    return _instance;
  }

  TeamRepository._internal();

  //String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';
  String baseUrl = 'http://localhost:8080';


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

  Future<List<TeamEntity>> getAllTeam({bool? isHomeTeam}) async {
    if (isHomeTeam == true) {
      var response = await KeycloakRepository().httpClient!.get('$baseUrl/team/getAllTeam', queryParameters: {'isHomeTeam': true});
      List<TeamEntity> homeTeamList = (response.data as List).map((teams) => TeamEntity.fromJson(teams)).toList();
      return homeTeamList;
    } else if (isHomeTeam == false) {
      var response = await KeycloakRepository().httpClient!.get('$baseUrl/team/getAllTeam', queryParameters: {'isHomeTeam': false});
      List<TeamEntity> awayTeamList = (response.data as List).map((teams) => TeamEntity.fromJson(teams)).toList();
      return awayTeamList;
    } else {
      var response = await KeycloakRepository().httpClient!.get('$baseUrl/team/getAllTeam');
      List<TeamEntity> allTeamList = (response.data as List).map((teams) => TeamEntity.fromJson(teams)).toList();
      return allTeamList;
    }
  }


  Future<TeamEntity> getTeamById(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/team/getTeamById/$id');
      print("ID TEAM");
      print(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        TeamEntity teamEntity = TeamEntity.fromJson(response.data);
        return teamEntity;
      } else {
        throw Exception('Failed to fetch team by ID: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching am by ID: $e");
      throw e;
    }
  }

  Future<List<AutocompleteEntity>> searchTeam(String value) async {
    try {
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/team/searchTeam', queryParameters: {'value': value});
      print("lista autocomplete");
      print(response.data);
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> searchData = List<Map<String, dynamic>>.from(response.data);
        List<AutocompleteEntity> autocompleteList = searchData.map((data) => AutocompleteEntity.fromJson(data)).toList();
        return autocompleteList;
      } else {
        throw Exception('Failed to search teams: ${response.statusCode}');
      }
    } catch (e) {
      print("Error searching teams: $e");
      throw e;
    }
  }



}