import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/repository/tournaments/tournaments_repository_fake.dart';

class TournamentsService {

  static final TournamentsService _instance = TournamentsService._internal();

  factory TournamentsService() {
    return _instance;
  }

  TournamentsService._internal();

  Future <List<TournamentEntityDtoForList>> fetchTournamentsList(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return TournamentsRepositoryFake().fetchTournamentsList();
    }
  }

  Future<TournamentEntity> fetchTournament(String id){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value(TournamentEntity.defaultValue());
    }else{
      return TournamentsRepositoryFake().fetchTournament();
    }
  }

}
