import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/repository/tournaments/tournaments_repository.dart';
import 'package:football_next_gen/repository/tournaments/tournaments_repository_fake.dart';

class TournamentsService {

  static final TournamentsService _instance = TournamentsService._internal();

  factory TournamentsService() {
    return _instance;
  }

  TournamentsService._internal();

  Future <List<TournamentEntity>> fetchTournamentsList(){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return TournamentsRepository().getAllTournaments();
    }else{
      return TournamentsRepositoryFake().fetchTournamentsList();
    }
  }

  Future<TournamentEntity> fetchCreateTournament(TournamentEntity tournamentEntity){
    if(GlobalConstants.sportsCenterProfileReal){
      return TournamentsRepository().createTournament(tournamentEntity);
    }else{
      return TournamentsRepositoryFake().fetchCreateTournament();
    }
  }

  Future<TournamentEntity> fetchTournament(int id){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return TournamentsRepository().getTournamentById(id);
    }else{
      return TournamentsRepositoryFake().fetchTournament();
    }
  }

}
