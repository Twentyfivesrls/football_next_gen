
class ExtraServiceRepository {

  static final ExtraServiceRepository _instance = ExtraServiceRepository._internal();

  factory ExtraServiceRepository() {
    return _instance;
  }

  ExtraServiceRepository._internal();

}