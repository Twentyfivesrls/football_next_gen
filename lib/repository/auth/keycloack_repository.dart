import 'package:dio/dio.dart';
import 'package:football_next_gen/models/authentication_entity.dart';
import 'package:football_next_gen/models/user_entity.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:developer';

class KeycloakRepository {
  static final KeycloakRepository _authentication =
  KeycloakRepository._internal();

  factory KeycloakRepository() {
    return _authentication;
  }

  KeycloakRepository._internal();

  Dio? httpClient;

  init() {
    httpClient = Dio();
  }
  String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';

  var fngAppClientId = "fng-app";
  var fngAppClientSecret = "w29HAjR5szxqr8l2qblKUUQXiDZXYA2U";

 /* login(String username, String password) async{
    var body = {
      "client_id": fngAppClientId,
      "client_secret": fngAppClientSecret,
      "grant_type": "password",
      "username": username,
      "password": password,
    };
    Options options =
    Options(headers: {"Content-Type": "application/x-www-form-urlencoded"});
    httpClient!
        .post(
        "http://80.211.123.141:8080/realms/Football-Next-Gen/protocol/openid-connect/token",
        data: body,
        options: options)
        .then((value) {
      print("RISULTATO CHIAMATA: ");
      print(value);

      String token = value.data["access_token"];
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      print(decodedToken);
      var roles = decodedToken['resource_access']['fng-app']['roles'];
      print("I RUOLI UTENTE TROVATI");
      print(roles);
    });
  }

  getUserRoles(token, userId) async {
    Options options = Options(headers: {"Authorization": token});
    var result = await httpClient!
        .get(
        "http://80.211.123.141:8080/admin/realms/Football-Next-Gen/users/$userId/role-mappings",
        options: options);
    return 'Bearer ${result.data["access_token"]}';
  }*/

  /*register(username, password) async {
    var token = await getAdminToken();
    var userId = await createUser(token, username, password);
    var body = await getAvailableRoles(token, userId, "centro_sportivo");
    var clientId = body['clientId'];
    var finalBody = [{
      "id": body['roleId'],
      "name": body['role'],
      "description": body['description'],
    }];
    var finalResult = await updateUserRole(token, finalBody, clientId, userId);
  }*/

  Future<dynamic> login(AuthenticationEntity authenticationEntity)async{
    var result = await httpClient!.post('$baseUrl/utente/authenticate', data: authenticationEntity.toJson());
    var token = result.data;
    this.httpClient!.options.headers['Authorization'] = 'Bearer $token';
    return result.data;
  }

  Future<bool> createUser(UserEntity userEntity)async{
    try {
      var result = await httpClient!.post('$baseUrl/utente/createUser', data: userEntity.toJson());
      return true;
    }catch(e){
      print("SIAMO IN ERRORE");
      return false;
    }
  }


  var adminCliAppClientId = "admin-cli";
  var adminCliAppClientSecret = "yotXnLuS4DMVtIPBES0oabzzZdE1Qbzs";
  var adminUsername = "admin";
  var adminPassword = "admin";

  getAdminToken() async{
    var body = {
      "client_id": adminCliAppClientId,
      "client_secret": adminCliAppClientSecret,
      "grant_type": "password",
      "username": adminUsername,
      "password": adminPassword,
    };
    Options options = Options(headers: {"Content-Type": "application/x-www-form-urlencoded"});
    var result = await httpClient!
        .post(
        "http://80.211.123.141:8080/realms/Football-Next-Gen/protocol/openid-connect/token",
        data: body,
        options: options);
    return 'Bearer ${result.data["access_token"]}';
  }

  getAvailableRoles(token,userId, roleToCompare) async {
    Options options2 = Options(headers: {"Authorization": token});
    var result = await httpClient!
        .get(
        "http://80.211.123.141:8080/admin/realms/Football-Next-Gen/ui-ext/available-roles/users/$userId?max=100",
        options: options2);
    List<dynamic> list = (result.data as List).where((element) => element["role"] == roleToCompare).toList();
    String roleId = list[0]["id"];
    String role = list[0]["role"];
    String description = list[0]["description"];
    String clientId = list[0]["clientId"];
    return {
      "roleId": roleId,
      "role": role,
      "description": description,
      "clientId": clientId
    };
  }

  /*createUser(token, username, password) async {
    var body2 = {
      "username": username,
      "credentials": [
        {"type": "password", "value": password, "temporary": false}
      ],
      "enabled": true
    };
    Options options2 = Options(headers: {"Authorization": token, "Produces": "application/json"});
    var result = await httpClient!
        .post("http://80.211.123.141:8080/admin/realms/Football-Next-Gen/users",
        data: body2, options: options2);
    String userId = result.headers.value('location')!.split('/').last;
    return userId;
  }*/

  updateUserRole(body, clientId, userId) async {
    var result = await httpClient!
        .post(
        "http://80.211.123.141:8080/admin/realms/Football-Next-Gen/users/$userId/role-mappings/clients/$clientId",
        data: body);
    return result.data;
  }


/*
  register(username, password) {
    var body = {
      "client_id": "admin-cli",
      "client_secret": "yotXnLuS4DMVtIPBES0oabzzZdE1Qbzs",
      "grant_type": "password",
      "username": "admin",
      "password": "admin",
    };
    Options options = Options(headers: {"Content-Type": "application/x-www-form-urlencoded"});
    httpClient!
        .post(
        "http://80.211.123.141:8080/realms/Football-Next-Gen/protocol/openid-connect/token",
        data: body,
        options: options)
        .then((value) {
      String token = value.data["access_token"];
      token = 'Bearer $token';
      finalizeRegistration(token, username, password);
    });
  }

  getRoles(token, id) {
    Options options2 = Options(headers: {"Authorization": token});
    httpClient!
        .get(
            "http://80.211.123.141:8080/admin/realms/Football-Next-Gen/ui-ext/available-roles/users/$id?max=100",
            options: options2)
        .then((value) {
      print("Available Roles");
      print(value.data);

      List<dynamic> list = (value.data as List).where((element) => element["role"] == "centro_sportivo").toList();
      String roleId = list[0]["id"];
      String role = list[0]["role"];
      String description = list[0]["description"];
      String clientId = list[0]["clientId"];

      addRoleToUser(token, roleId, role, description, clientId, id);
    });
  }


  addRoleToUser(token, id, name, description, clientId, userId){
    Options options = Options(headers: {"Authorization": token});
    var body = [
      {
        "id" : id,
        "name" : name,
        "description" : description,
      }
    ];
    httpClient!
        .post(
        "http://80.211.123.141:8080/admin/realms/Football-Next-Gen/users/$userId/role-mappings/clients/$clientId",
        data: body,
        options: options)
        .then((value) {

          print("RISULTATO AGGIUNTA RUOLO");
          print(value.data);
    });
  }

  finalizeRegistration(token, username, password) {
    // here we need to register the new user
    var body2 = {
      "username": username,
      "credentials": [
        {"type": "password", "value": password, "temporary": false}
      ],
      "enabled": true
    };
    Options options2 = Options(headers: {"Authorization": token, "Produces": "application/json"});
    httpClient!
        .post("http://80.211.123.141:8080/admin/realms/Football-Next-Gen/users",
            data: body2, options: options2)
        .then((value) {
      print("REGISTERED RESULT = ");
      print(value);
      print("HEADERS");
      print(value.headers.map);
      String userId = value.headers.value('location')!.split('/').last;
      getRoles(token, userId);
    });
  }

   */
}
