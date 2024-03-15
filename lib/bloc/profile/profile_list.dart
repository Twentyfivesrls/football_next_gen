import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/repository/profile/profile_service.dart';

class ProfileListCubit extends Cubit<ProfileListPageState> {

  ProfileListCubit() : super(ProfileListPageLoading());
  void fetchUserProfileLists() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(ProfileListPageLoading());

    // fetch data
    try{
      List<ProfileEntityDtoForList> entity = await ProfileService().fetchProfileList();
      emit(ProfileListPageLoaded(profiles: entity));
    }catch(e){
      emit(ProfileListPageError(error: e));
    }
  }
}

@immutable
class ProfileListPageState{}

class ProfileListPageLoading extends ProfileListPageState{}
class ProfileListPageLoaded extends ProfileListPageState{
  List<ProfileEntityDtoForList > profiles;
  ProfileListPageLoaded({required this.profiles});
}
class ProfileListPageError extends ProfileListPageState{
  dynamic error;
  ProfileListPageError({required this.error});
}

