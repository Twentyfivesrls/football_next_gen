import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/repository/post/post_service.dart';

class PostListCubit extends Cubit<PostListPageState> {

  PostListCubit() : super(PostListPageLoading());
  void fetchUserPostLists() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(PostListPageLoading());

    // fetch data
    try{
      List<PostEntityDtoForList> entity = await PostService().fetchPostsList();
      emit(PostListPageLoaded(posts: entity));
    }catch(e){
      emit(PostListPageError(error: e));
    }
  }
}

@immutable
class PostListPageState{}

class PostListPageLoading extends PostListPageState{}
class PostListPageLoaded extends PostListPageState{
  List<PostEntityDtoForList > posts;
  PostListPageLoaded({required this.posts});
}
class PostListPageError extends PostListPageState{
  dynamic error;
  PostListPageError({required this.error});
}

