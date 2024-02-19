import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/repository/profile/sport_fields_repository_fake.dart';
import '../../models/sport_field.dart';

class SportFieldsService {

  static final SportFieldsService _instance = SportFieldsService._internal();

  factory SportFieldsService() {
    return _instance;
  }

  SportFieldsService._internal();

  Future <List<SportFieldEntity>> fetchFields(){
    if(GlobalConstants.profileReal){

      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return SportFieldsRepositoryFake().fetchFields();
    }
  }

}
