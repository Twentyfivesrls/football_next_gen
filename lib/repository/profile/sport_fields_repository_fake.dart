import 'package:football_next_gen/models/sport_field.dart';

class SportFieldsRepositoryFake {

  static final SportFieldsRepositoryFake _instance = SportFieldsRepositoryFake._internal();

  factory SportFieldsRepositoryFake() {
    return _instance;
  }

  SportFieldsRepositoryFake._internal();

  Future<List<SportFieldEntity>> fetchFields(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<SportFieldEntity> result = [];
    for(int i = 0; i<5; i++){
      result.add(SportFieldEntity.defaultValue());
    }
    return Future.value(result);        // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}