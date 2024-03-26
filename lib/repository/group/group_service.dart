import 'package:flutter/material.dart';
import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/repository/group/group_repository.dart';
import 'package:football_next_gen/repository/group/group_repository_fake.dart';

class GroupService {

  static final GroupService _instance = GroupService._internal();

  factory GroupService() {
    return _instance;
  }

  GroupService._internal();


  Future<List<GroupEntity>> fetchGroupsList(){
    if(GlobalConstants.sportsCenterProfileReal){
      return GroupRepository().getAllGroup();
    }else{
      return GroupRepositoryFake().fetchGroupsList();
    }
  }

  Future<GroupEntity> fetchGroup(int id){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return GroupRepository().getGroupById(id);
    }else{
      return GroupRepositoryFake().fetchGroup();
    }
  }

  Future<GroupEntity> fetchCreateGroup(GroupEntity groupEntity){
    if(GlobalConstants.sportsCenterProfileReal){
      return GroupRepository().createGroup(groupEntity);
    }else{
      return GroupRepositoryFake().fetchGroup();
    }
  }

}
