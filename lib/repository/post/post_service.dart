import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/repository/post/post_repository_fake.dart';

class PostService {

  static final PostService _instance = PostService._internal();

  factory PostService() {
    return _instance;
  }

  PostService._internal();

  Future <List<PostEntityDtoForList>> fetchPostsList(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return PostRepositoryFake().fetchPostsList();
    }
  }

  Future <List<PostEntity>> fetchHomePosts(){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value([]);
    }else{
      return PostRepositoryFake().fetchHomePosts();
    }
  }

  Future<PostEntity> fetchPost(String id){
    if(GlobalConstants.profileReal){
      // TODO implement it when we need to call the real backend
      return Future.value(PostEntity.defaultValue());
    }else{
      return PostRepositoryFake().fetchPost();
    }
  }

}
