
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/repository/group/group_service.dart';



class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(CreateGroupState(groupEntity: GroupEntity.emptyGroup()));

  fetchCreateGroup(GroupEntity groupEntity, int id)async{
    GroupEntity result = await GroupService().fetchCreateGroup(groupEntity, id);
    emit(CreateGroupState( groupEntity: result));

  }
}
@immutable
class CreateGroupState {
  GroupEntity groupEntity;
  CreateGroupState({required this.groupEntity});
}

