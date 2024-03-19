
import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';
import 'package:football_next_gen/repository/profile/profile_repository.dart';
import 'package:football_next_gen/repository/profile/profile_repository_fake.dart';
import 'package:dio/dio.dart';

class ProfileService {

  static final ProfileService _instance = ProfileService._internal();

  factory ProfileService() {
    return _instance;
  }

  ProfileService._internal();


  Future<UserEntity> fetchProfile() async {
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      Response response = await ProfileRepository().getUserProfile();
      return UserEntity.fromJson(response.data);
    }else{
      return ProfileRepositoryFake().fetchProfile();
    }
  }


  Future <List<ProfileEntityDtoForList>> fetchProfileList(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return ProfileRepositoryFake().fetchProfileList();
    }
  }
}
