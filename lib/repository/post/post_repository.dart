
class PostRepository {

  static final PostRepository _instance = PostRepository._internal();

  factory PostRepository() {
    return _instance;
  }

  PostRepository._internal();

}