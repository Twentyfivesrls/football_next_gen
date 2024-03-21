


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

  Future<GroupEntity> createTournament(GroupEntity groupEntity) async {
    var response = await KeycloakRepository().httpClient!.post('$baseUrl/group/createTournament', data: groupEntity.toJson());
    print("Gruppo CREATO");
    print(response.data);
    return response.data;
  }

}