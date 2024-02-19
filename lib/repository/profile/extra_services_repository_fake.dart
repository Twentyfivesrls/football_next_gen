import 'package:football_next_gen/models/extra_service.dart';

class ExtraServiceRepositoryFake {

  static final ExtraServiceRepositoryFake _instance = ExtraServiceRepositoryFake._internal();

  factory ExtraServiceRepositoryFake() {
    return _instance;
  }

  ExtraServiceRepositoryFake._internal();


  Future<List<ExtraServiceEntity>> fetchServices(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<ExtraServiceEntity> result = [];
    for(int i = 0; i<5; i++){
      result.add(ExtraServiceEntity.defaultValue());
    }
    return Future.value(result);        // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

}