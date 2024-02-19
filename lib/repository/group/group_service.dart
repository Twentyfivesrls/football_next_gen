import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/group_entity.dart';
import 'package:football_next_gen/repository/group/group_repository_fake.dart';

class GroupService {

  static final GroupService _instance = GroupService._internal();

  factory GroupService() {
    return _instance;
  }

  GroupService._internal();


  Future<List<GroupEntityDtoForList>> fetchGroupsList(){
    //sleep(const Duration(seconds:5));
    // trying with dummy data
    List<GroupEntityDtoForList> result = [];
    for(int i = 0; i<10; i++){
      result.add(GroupEntityDtoForList.defaultValue());
    }
    return Future.value(result);
    // trying with exception
    throw Exception("Sono un cazzo di messaggio di errore");
  }

  Future<GroupEntity> fetchGroup(String id){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value(GroupEntity.defaultValue());
    }else{
      return GroupRepositoryFake().fetchGroup();
    }
  }

}
