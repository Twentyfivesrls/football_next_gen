import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/repository/post/post_service.dart';

class PostHomeListCubit extends Cubit<PostHomeListPageState> {

  PostHomeListCubit() : super(PostHomeListPageLoading());
  void fetchUserPostHomeLists() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(PostHomeListPageLoading());

    // fetch data
    try{
      List<PostEntity> entity = await PostService().fetchHomePosts();
      emit(PostHomeListPageLoaded(posts: entity));
    }catch(e){
      emit(PostHomeListPageError(error: e));
    }
  }
}

@immutable
class PostHomeListPageState{}

class PostHomeListPageLoading extends PostHomeListPageState{}
class PostHomeListPageLoaded extends PostHomeListPageState{
  List<PostEntity> posts;
  PostHomeListPageLoaded({required this.posts});
}
class PostHomeListPageError extends PostHomeListPageState{
  dynamic error;
  PostHomeListPageError({required this.error});
}

