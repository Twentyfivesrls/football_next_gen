import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/sport.dart';
import 'package:football_next_gen/repository/profile/sport_repository_fake.dart';

class SportService {

  static final SportService _instance = SportService._internal();

  factory SportService() {
    return _instance;
  }

  SportService._internal();

  Future <List<SportEntity>> fetchSports(){
    if(GlobalConstants.profileReal){

      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return SportRepositoryFake().fetchSports();
    }
  }

}
