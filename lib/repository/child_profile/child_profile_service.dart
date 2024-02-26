import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/child_profile_entity.dart';
import 'package:football_next_gen/repository/child_profile/child_profile_repository_fake.dart';

class ChildProfileService {

  static final ChildProfileService _instance = ChildProfileService._internal();

  factory ChildProfileService() {
    return _instance;
  }

  ChildProfileService._internal();


  Future<ChildProfileEntity> fetchChildProfile(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value(ChildProfileEntity.defaultValue());
    }else{
      return ChildProfileRepositoryFake().fetchChildProfile();
    }
  }

}
