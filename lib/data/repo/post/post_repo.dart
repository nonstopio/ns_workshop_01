import '../../model/post.dart';

abstract class PostRepo {
  Future<List<Post>> getPosts();

  Future<bool> createPost(Post post);
}
