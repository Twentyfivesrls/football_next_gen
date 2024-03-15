
import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/profile_entity.dart';
import 'package:football_next_gen/repository/profile/profile_repository.dart';
import 'package:football_next_gen/repository/profile/profile_repository_fake.dart';

class ProfileService {

  static final ProfileService _instance = ProfileService._internal();

  factory ProfileService() {
    return _instance;
  }

  ProfileService._internal();


  Future<ProfileEntity> fetchProfile(id){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return ProfileRepository().getUserProfile(id);
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
