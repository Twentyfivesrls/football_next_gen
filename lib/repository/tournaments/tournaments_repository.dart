
class TournamentsRepository {

  static final TournamentsRepository _instance = TournamentsRepository._internal();

  factory TournamentsRepository() {
    return _instance;
  }

  TournamentsRepository._internal();

}