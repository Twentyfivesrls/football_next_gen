
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/repository/post/post_service.dart';



class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostState(postEntity: PostEntity.emptyPost()));

  fetchCreatePost(PostEntity postEntity)async{
    var result = await PostService().fetchCreatePost(postEntity);
      emit(CreatePostState( postEntity: result));

  }
}
  @immutable
  class CreatePostState {
  PostEntity postEntity;
  CreatePostState({required this.postEntity});
}

