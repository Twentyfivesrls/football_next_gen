import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/repository/group/group_service.dart';

class GroupCubit extends Cubit<GroupPageState> {

  GroupCubit() : super(GroupPageLoading());


  void fetchGroup() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(GroupPageLoading());

    // fetch data
    try{
      List<GroupEntity> entity = await GroupService().fetchGroupsList();
      emit(GroupPageLoaded(groups: entity));
    }catch(e){
      emit(GroupPageError(error: e));
    }
  }
}
@immutable
class GroupPageState{}

class GroupPageLoading extends GroupPageState{}
class GroupPageLoaded extends GroupPageState{
  List<GroupEntity> groups;
  GroupPageLoaded({required this.groups});
}

class GroupPageError extends GroupPageState{
  dynamic error;
  GroupPageError({required this.error});
}

