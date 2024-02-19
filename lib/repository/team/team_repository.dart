
class TeamRepository {

  static final TeamRepository _instance = TeamRepository._internal();

  factory TeamRepository() {
    return _instance;
  }

  TeamRepository._internal();

}