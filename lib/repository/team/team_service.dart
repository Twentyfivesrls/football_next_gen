import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/autocomplete_entity.dart';
import 'package:football_next_gen/models/team_entity.dart';
import 'package:football_next_gen/repository/team/team_repository.dart';
import 'package:football_next_gen/repository/team/team_repository_fake.dart';

class TeamService {

  static final TeamService _instance = TeamService._internal();

  factory TeamService() {
    return _instance;
  }

  TeamService._internal();

  Future<List<TeamEntity>> fetchTeamsList({bool? isHomeTeam}) {
    if (GlobalConstants.sportsCenterProfileReal) {
      if (isHomeTeam == true) {
        return TeamRepository().getAllTeam(isHomeTeam: true);
      } else if (isHomeTeam == false) {
        return TeamRepository().getAllTeam(isHomeTeam: false);
      } else {
        return TeamRepository().getAllTeam(); // Nessun argomento fornito, ottenere tutte le squadre
      }
    } else {
      return TeamRepositoryFake().fetchTeamsList();
    }
  }



  Future<TeamEntity> fetchTeam(int id){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return TeamRepository().getTeamById(id);
    }else{
      return TeamRepositoryFake().fetchTeam();
    }
  }

  Future<TeamEntity> fetchCreateTeam(TeamEntity teamEntity){
    if(GlobalConstants.sportsCenterProfileReal){
      return TeamRepository().createTeam(teamEntity);
    }else{
      return TeamRepositoryFake().fetchCreateTeam();
    }
  }

  Future<List<AutocompleteEntity>> fetchSearchTeam (String value){
    if(GlobalConstants.sportsCenterProfileReal){
      return TeamRepository().searchTeam(value);
    }
    return TeamRepositoryFake().fetchAutocompleteTeamsList();
  }

}
