
import 'package:intl/intl.dart';

import 'package:football_next_gen/models/training_entity.dart';
import 'package:dio/dio.dart';

import '../auth/keycloack_repository.dart';

class TrainingRepository {

  static final TrainingRepository _instance = TrainingRepository._internal();

  factory TrainingRepository() {
    return _instance;
  }

  TrainingRepository._internal();

  //String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';
  String baseUrl = 'http://localhost:8080';


  Future<List<TrainingEntity>> getAllTrainings() async {
    try {
      var response = await KeycloakRepository().httpClient!.get('$baseUrl/training/getAllTrainings');
      if (response.data != null) {
        List<TrainingEntity> trainingsList = (response.data as List).map((trainings) => TrainingEntity.fromJson(trainings)).toList();
        return trainingsList;
      } else {
        throw Exception('Failed to fetch trainings: response data is null');
      }
    } catch (e) {
      print("Error fetching trainings: $e");
      throw e;
    }
  }


  Future<TrainingEntity> createTraining(TrainingEntity trainingEntity) async {
    try {
      print("Sto creando un allenamneto");
      Response response = await KeycloakRepository().httpClient!.post(
          '$baseUrl/training/createTraining', data: trainingEntity.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        TrainingEntity teamEntity = TrainingEntity.fromJson(response.data);
        return teamEntity;
      } else {
        throw Exception('Failed to update post: ${response.statusCode}');
      }
    } catch (e) {
      print("Error updating post: $e");
      throw e;
    }
  }

  Future<TrainingEntity> getTrainingById(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/training/getTrainingById/$id');
      print(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        TrainingEntity post = TrainingEntity.fromJson(response.data);
        return post;
      } else {
        throw Exception('Failed to fetch training by ID: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching training by ID: $e");
      throw e;
    }
  }


  Future<void> deleteTraining(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.delete('$baseUrl/training/deleteTraining/$id');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print('Post deleted successfully');
      } else {
        throw Exception('Failed to delete post: ${response.statusCode}');
      }
    } catch (e) {
      print("Error deleting post: $e");
      throw e;
    }
  }

  Future<List<TrainingEntity>> getTrainingsByDate(DateTime date) async {
    try {
      // Converti la data nel formato corretto senza l'ora
      final formattedDate = DateFormat('yyyy-MM-dd').format(date);

      // Esegui la richiesta HTTP con la data formattata
      var response = await KeycloakRepository().httpClient!.get('$baseUrl/training/date?date=$formattedDate');
      print(response.data);
      if (response.data != null) {
        List<TrainingEntity> trainingsList = (response.data as List).map((trainings) => TrainingEntity.fromJson(trainings)).toList();
        return trainingsList;
      } else {
        throw Exception('Failed to fetch trainings by date: response data is null');
      }
    } catch (e) {
      print("Error fetching trainings by date: $e");
      throw e;
    }
  }


}
