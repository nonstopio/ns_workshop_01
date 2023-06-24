import 'package:dio/dio.dart';

import '../../model/post.dart';
import 'post_repo.dart';

class PostRepoImpl implements PostRepo {
  @override
  Future<bool> createPost(Post post) async {
    final Response res = await Dio().post(
      'https://3e79-103-195-83-128.ngrok-free.app/api/createPost',
      data: post.toJson(),
    );
    return res.statusCode == 200;
  }

  @override
  Future<List<Post>> getPosts() async {
    final Response res = await Dio()
        .get('https://3e79-103-195-83-128.ngrok-free.app/api/fetchAllPost');
    if (res.statusCode == 200) {
      final raw = res.data['data'] as List;
      return raw.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
