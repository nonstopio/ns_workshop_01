import '../../model/post.dart';
import 'post_repo.dart';

class PostRepoMockImpl implements PostRepo {
  @override
  Future<bool> createPost(Post post) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Post(title: 'title 1', body: 'body 1'),
      Post(title: 'title 2', body: 'body 2'),
      Post(title: 'title 3', body: 'body 3'),
      Post(title: 'title 4', body: 'body 4'),
      Post(title: 'title 5', body: 'body 5'),
    ];
  }
}
