import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';
import 'package:football_next_gen/repository/profile/profile_service.dart';

class ProfileCubit extends Cubit<ProfilePageState> {

  ProfileCubit() : super(ProfilePageLoading());
  get entity => null;
   fetchUserProfile() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO

    emit(ProfilePageLoading());
    // fetch data
    try{
      UserEntity result = await ProfileService().fetchProfile();
      print(result);
      emit(ProfilePageLoaded(profile: result));
    }catch(e){
      emit(ProfilePageError(error: e));
    }
  }
}
@immutable
class ProfilePageState{}

class ProfilePageLoading extends ProfilePageState{}
class ProfilePageLoaded extends ProfilePageState{
  UserEntity profile;
  ProfilePageLoaded({required this.profile});
}

class ProfilePageError extends ProfilePageState{
  dynamic error;
  ProfilePageError({required this.error});
}

