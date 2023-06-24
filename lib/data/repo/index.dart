import 'package:get_it/get_it.dart';
import 'package:workshop_01/data/repo/post/post_repo.dart';

import 'post/post_repo_impl.dart';

void initRepo() {
  GetIt.instance.registerSingleton<PostRepo>(PostRepoImpl());
}

PostRepo get postRepo => GetIt.instance.get<PostRepo>();
