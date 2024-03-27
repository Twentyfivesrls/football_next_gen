import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/repository/auth/keycloack_repository.dart';
class PostRepository {

  static final PostRepository _instance = PostRepository._internal();

  factory PostRepository() {
    return _instance;
  }

  PostRepository._internal();


  String baseUrl = 'http://80.211.123.141:8088/football-next-gen-be';
  //String baseUrl = 'http://localhost:8080';


  Future<List<PostEntity>> getAllPost()async{
    Response response;
    response = await KeycloakRepository().httpClient!.get('$baseUrl/post/getAllPost');
    List<PostEntity> postList = (response.data as List).map((posts) => PostEntity.fromJson(posts)).toList();
    return postList;
  }

  Future<PostEntity> createPost(PostEntity postEntity) async{
      try {
        Response response =  await KeycloakRepository().httpClient!.post('$baseUrl/post/createPost', data: postEntity.toJson());
        if (response.statusCode! >= 201 && response.statusCode! < 300) {
          PostEntity updatedPost = PostEntity.fromJson(response.data);
          return updatedPost;
        } else {
          throw Exception('Failed to update post: ${response.statusCode}');
        }
      } catch (e) {
        print("Error updating post: $e");
        throw e;
      }
  }



  Future<PostEntity> getPostById(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.get('$baseUrl/post/$id');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        PostEntity post = PostEntity.fromJson(response.data);
        return post;
      } else {
        throw Exception('Failed to fetch post by ID: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching post by ID: $e");
      throw e;
    }
  }

  Future<PostEntity> updatePost(PostEntity post, int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.put('$baseUrl/post/updatePost/$id', data: post.toJson());

      if (response.statusCode == 200) {
        PostEntity updatedPost = PostEntity.fromJson(response.data);
        return updatedPost;
      } else {
        throw Exception('Failed to update post: ${response.statusCode}');
      }
    } catch (e) {
      print("Error updating post: $e");
      throw e;
    }
  }

  Future<void> deletePost(int id) async {
    try {
      Response response = await KeycloakRepository().httpClient!.delete('$baseUrl/post/$id');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        print('Post deleted successfully');
      } else {
        throw Exception('Failed to delete post: ${response.statusCode}');
      }
    } catch (e) {
      print("Error deleting post: $e");
      throw e;
    }
  }

}