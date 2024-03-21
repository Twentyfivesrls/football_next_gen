import 'package:dio/dio.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';

class ProfileRepository {
  static final ProfileRepository _instance = ProfileRepository._internal();

  factory ProfileRepository() {
    return _instance;
  }

  ProfileRepository._internal();



   String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';

  Future<Response> getUserProfile() async {
    var url = '$baseUrl/utente/getUserDetails';
    Response response = await KeycloakRepository().httpClient!.get(url);

    return response;
  }

  dynamic manageStandardResponseCodes(Response response) {

  }
}
