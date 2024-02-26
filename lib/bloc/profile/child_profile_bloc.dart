import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/child_profile_entity.dart';
import 'package:football_next_gen/repository/child_profile/child_profile_service.dart';

class ChildProfileCubit extends Cubit<ChildProfilePageState> {

  ChildProfileCubit() : super(ChildProfilePageLoading());

  void fetchChildProfile() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(ChildProfilePageLoading());

    // fetch data
    try{
      ChildProfileEntity entity = await ChildProfileService().fetchChildProfile();
      emit(ChildProfilePageLoaded(profile: entity));
    }catch(e){
      emit(ChildProfilePageError(error: e));
    }
  }
}

@immutable
class ChildProfilePageState{}
class ChildProfilePageLoading extends ChildProfilePageState{}
class ChildProfilePageLoaded extends ChildProfilePageState{
  ChildProfileEntity profile;
  ChildProfilePageLoaded({required this.profile});
}

class ChildProfilePageError extends ChildProfilePageState{
  dynamic error;
  ChildProfilePageError({required this.error});
}

