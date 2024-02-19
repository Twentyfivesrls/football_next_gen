import '../../models/sport.dart';

class SportRepositoryFake {

  static final SportRepositoryFake _instance = SportRepositoryFake._internal();

  factory SportRepositoryFake() {
    return _instance;
  }

  SportRepositoryFake._internal();


  Future<List<SportEntity>> fetchSports(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<SportEntity> result = [];
    for(int i = 0; i<5; i++){
      result.add(SportEntity.defaultValue());
    }
    return Future.value(result);    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}