


import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/repository/profile/profile_repository_fake.dart';

class ProfileService {

  static final ProfileService _instance = ProfileService._internal();

  factory ProfileService() {
    return _instance;
  }

  ProfileService._internal();


  Future<ProfileEntity> fetchProfile(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value(ProfileEntity.defaultValue());
    }else{
      return ProfileRepositoryFake().fetchProfile();
    }
  }

}
