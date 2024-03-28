import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';

class GroupRepository {

  static final GroupRepository _instance = GroupRepository._internal();

  factory GroupRepository() {
    return _instance;
  }

  GroupRepository._internal();
  //String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';
  String baseUrl = 'http://localhost:8080';



  Future<List<GroupEntity>> getAllGroup()async{
    var response = await KeycloakRepository().httpClient!.get('$baseUrl/group/getAllGroup');
    List<GroupEntity> groupList = (response.data as List).map((tournaments) => GroupEntity.fromJson(tournaments)).toList();
    return groupList;
  }

  Future<GroupEntity> createGroup(GroupEntity groupEntity, int id) async {
    try {
      print("Sto creando un torneo");
      Response response = await KeycloakRepository().httpClient!.post(
          '$baseUrl/group/createGroupWithMatches/$id', data: groupEntity.toJson());
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        GroupEntity groupEntity = GroupEntity.fromJson(response.data);
        return groupEntity;
      } else {
        throw Exception('Failed to create tournament: ${response.statusCode}');
      }
    } catch (e) {
      print("Error create tournament: $e");
      throw e;
    }
  }


  Future<GroupEntity> getGroupById(int id) async {
    try {
      print('Response data ID');
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/group/getGroupById/$id');
      print('Response data: ${response.data}');
      print('Response status code: ${response.statusCode}');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        GroupEntity group = GroupEntity.fromJson(response.data);
        return group;
      } else {
        throw Exception('Failed to fetch post by ID: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching post by ID: $e");
      throw e;
    }
  }

}