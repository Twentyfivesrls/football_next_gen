import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/post_entity.dart';
import 'package:football_next_gen/repository/post/post_service.dart';

class SinglePostCubit extends Cubit<SinglePostPageState> {

  SinglePostCubit() : super(SinglePostPageLoading());

  void fetchPost(int id) async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(SinglePostPageLoading());

    // fetch data
    try {
      PostEntity entity = await PostService().fetchPost(id);
      emit(SinglePostPageLoaded(post: entity));
    } catch (e) {
      emit(SinglePostPageError(error: e));
    }
  }

  fetchUpdatePost(PostEntity postEntity, int id)async{
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(SinglePostPageLoading());

    // fetch data
    try {
      PostEntity entity =  await PostService().fetchUpdatePost(postEntity, id);
      emit(SinglePostPageLoaded(post: entity));
    } catch (e) {
      emit(SinglePostPageError(error: e));
    }
  }


  void fetchDeletePost(int id) async {
    // Invia uno stato di caricamento prima di eliminare il post
    emit(SinglePostPageLoading());

    try {
      // Elimina il post
      await PostService().fetchDeletePost(id);
      // Invia uno stato di eliminazione avvenuta con successo
      emit(SinglePostPageDeleted());
    } catch (e) {
      // Se si verifica un errore, invia uno stato di errore
      emit(SinglePostPageError(error: e));
    }
  }
}


@immutable
class SinglePostPageState{}
class SinglePostPageLoading extends SinglePostPageState{}
class SinglePostPageLoaded extends SinglePostPageState{
  PostEntity post;
  SinglePostPageLoaded({required this.post});

}
class SinglePostPageDeleted extends SinglePostPageState {}

class SinglePostPageError extends SinglePostPageState{
  dynamic error;
  SinglePostPageError({required this.error});
}

