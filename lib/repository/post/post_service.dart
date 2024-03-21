import 'package:football_next_gen/constants/global_application_constants.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/repository/post/post_repository.dart';
import 'package:football_next_gen/repository/post/post_repository_fake.dart';

class PostService {

  static final PostService _instance = PostService._internal();

  factory PostService() {
    return _instance;
  }

  PostService._internal();

  Future <List<PostEntity>> fetchPostsList(){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return PostRepository().getAllPost();
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

  Future<PostEntity> fetchCreatePost(PostEntity postEntity){
    if(GlobalConstants.sportsCenterProfileReal){
      return PostRepository().createPost(postEntity);
    }else{
      return PostRepositoryFake().fetchPost();
    }
  }

  Future<PostEntity> fetchPost(int id){
    if(GlobalConstants.sportsCenterProfileReal){
      // TODO implement it when we need to call the real backend
      return PostRepository().getPostById(id);
    }else{
      return PostRepositoryFake().fetchPost();
    }
  }

  Future<PostEntity> fetchUpdatePost(PostEntity postEntity, int id){
    if(GlobalConstants.sportsCenterProfileReal){
      return PostRepository().updatePost(postEntity, id);
    }else{
      return PostRepositoryFake().fetchUpdatePost();
    }
  }

  Future<void> fetchDeletePost(int id) {
    if(GlobalConstants.sportsCenterProfileReal){
      return PostRepository().deletePost(id);
    }else{
      return PostRepositoryFake().fetchDeletePost();
    }
  }

}
