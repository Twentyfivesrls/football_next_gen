import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/team/team_repository_fake.dart';

class TeamService {

  static final TeamService _instance = TeamService._internal();

  factory TeamService() {
    return _instance;
  }

  TeamService._internal();

  Future <List<TeamEntityDtoForList>> fetchTeamsList(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return TeamRepositoryFake().fetchTeamsList();
    }
  }

  Future<TeamEntity> fetchTeam(String id){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value(TeamEntity.defaultValue());
    }else{
      return TeamRepositoryFake().fetchTeam();
    }
  }

}
