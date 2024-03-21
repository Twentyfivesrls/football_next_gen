import 'package:dio/dio.dart';
import 'package:football_next_gen/models/tournament.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';

class TournamentsRepository {

  static final TournamentsRepository _instance = TournamentsRepository._internal();

  factory TournamentsRepository() {
    return _instance;
  }

  TournamentsRepository._internal();



String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';


Future<List<TournamentEntity>> getAllTournaments()async{
  var response = await KeycloakRepository().httpClient!.get('$baseUrl/tournament/getAllTournaments');
  List<TournamentEntity> tournamentList = (response.data as List).map((tournaments) => TournamentEntity.fromJson(tournaments)).toList();
  return tournamentList;
}

Future<TournamentEntity> createTournament(TournamentEntity tournamentEntity) async {
  var response = await KeycloakRepository().httpClient!.post('$baseUrl/tournament/createTournament', data: tournamentEntity.toJson());
  print("TORNEO CREATO");
  print(response.data);
  return response.data;
}

  Future<TournamentEntity> getTournamentById(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/tournament/getTournamentById/$id');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        TournamentEntity post = TournamentEntity.fromJson(response.data);
        return post;
      } else {
        throw Exception('Failed to fetch post by ID: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching post by ID: $e");
      throw e;
    }
  }

}