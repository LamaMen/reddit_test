part of 'bloc.dart';

@immutable
abstract class PostsEvent {}

class UpdatePosts implements PostsEvent {
  const UpdatePosts();
}
