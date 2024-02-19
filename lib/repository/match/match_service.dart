import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'match_repository_fake.dart';

class MatchService {

  static final MatchService _instance = MatchService._internal();

  factory MatchService() {
    return _instance;
  }

  MatchService._internal();

  Future <List<MatchEntity>> fetchMatches(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return MatchRepositoryFake().fetchMatches();
    }
  }

}
