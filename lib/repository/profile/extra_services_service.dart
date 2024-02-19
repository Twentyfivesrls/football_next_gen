import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/repository/profile/extra_services_repository_fake.dart';

class ExtraServicesService {

  static final ExtraServicesService _instance = ExtraServicesService._internal();

  factory ExtraServicesService() {
    return _instance;
  }

  ExtraServicesService._internal();

  Future <List<ExtraServiceEntity>> fetchServices(){
    if(GlobalConstants.profileReal){

      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return ExtraServiceRepositoryFake().fetchServices();
    }
  }

}
