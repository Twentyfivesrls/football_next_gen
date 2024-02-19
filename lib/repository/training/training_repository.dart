
class TrainingRepository {

  static final TrainingRepository _instance = TrainingRepository._internal();

  factory TrainingRepository() {
    return _instance;
  }

  TrainingRepository._internal();

}