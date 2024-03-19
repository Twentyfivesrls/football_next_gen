import 'package:dio/dio.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:dio/dio.dart';
import 'package:football_next_gen/models/post_entity.dart';
class PostRepository {

  static final PostRepository _instance = PostRepository._internal();

  factory PostRepository() {
    return _instance;
  }

  PostRepository._internal();

  Dio? httpClient;

  init() {
    httpClient = Dio();
  }

  String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';


  Future<List<PostEntity>> getAllPost()async{
    Response response;
    try{
      response = await httpClient!.get('$baseUrl/post/getAllPost');
    }on DioError catch(e){
      return List.empty(growable: true);
    } if (response.statusCode != 200){
      return List.empty(growable: true);
    }
    List<PostEntity> postList = (response.data as List).map((posts) => PostEntity.fromJson(posts)).toList();
    print("TUTTI I POST: $postList");
    return postList;
  }

  Future<dynamic> createPost(PostEntity postEntity, int id) async{
      var response = await httpClient!.post('$baseUrl/post/createPost/$id', data: postEntity.toJson());
      return response.data;
  }



}