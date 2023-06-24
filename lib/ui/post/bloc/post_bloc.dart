import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/post.dart';
import '../../../data/repo/index.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<AddPost>((event, emit) async {
      emit(PostLoading());
      final res = await postRepo.createPost(event.post);
      emit(const PostLoaded());
    });
  }
}
