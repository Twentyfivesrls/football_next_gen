import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/match_entity.dart';
import 'package:football_next_gen/repository/match/match_repository.dart';
import 'match_repository_fake.dart';

class MatchService {

  static final MatchService _instance = MatchService._internal();

  factory MatchService() {
    return _instance;
  }

  MatchService._internal();

  Future <List<MatchEntity>> fetchMatches(){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return MatchRepository().getAllMatch();
    }else{
      return MatchRepositoryFake().fetchMatches();
    }
  }

  Future<MatchEntity> fetchCreateMatch (MatchEntity matchEntity){
    if(GlobalConstants.sportsCenterProfileReal){
      return MatchRepository().createMatch(matchEntity);
    }else{
      return MatchRepositoryFake().fetchCreateMatch(matchEntity);
    }
  }

  Future<MatchEntity> fetchGetMatch (int id){
    if(GlobalConstants.sportsCenterProfileReal){
      return MatchRepository().getMatchesByGroupId(id);
    }else{
      return MatchRepositoryFake().fetchMatch(id);
    }
  }

}
