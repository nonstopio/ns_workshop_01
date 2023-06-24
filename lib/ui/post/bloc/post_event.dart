part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class AddPost extends PostEvent {
  final Post post;

  const AddPost(this.post);

  @override
  List<Object> get props => [post];
}
