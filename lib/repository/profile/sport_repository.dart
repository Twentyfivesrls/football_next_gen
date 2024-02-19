
class SportRepository {

  static final SportRepository _instance = SportRepository._internal();

  factory SportRepository() {
    return _instance;
  }

  SportRepository._internal();

}