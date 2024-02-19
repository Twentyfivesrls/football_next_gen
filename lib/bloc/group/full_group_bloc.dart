import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/repository/group/group_service.dart';

class FullGroupCubit extends Cubit<FullGroupPageState> {

  FullGroupCubit() : super(FullGroupPageLoading());

  void fetchGroup(String id) async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(FullGroupPageLoading());

    // fetch data
    try{
      GroupEntity entity = await GroupService().fetchGroup(id);
      emit(FullGroupPageLoaded(group: entity));
    }catch(e){
      emit(FullGroupPageError(error: e));
    }
  }
}

@immutable
class FullGroupPageState{}
class FullGroupPageLoading extends FullGroupPageState{}
class FullGroupPageLoaded extends FullGroupPageState{
  GroupEntity group;
  FullGroupPageLoaded({required this.group});
}
class FullGroupPageError extends FullGroupPageState{
  dynamic error;
  FullGroupPageError({required this.error});
}

