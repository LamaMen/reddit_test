part of 'bloc.dart';

@immutable
class PostsState {}

class WithPostsState implements PostsState {
  const WithPostsState(this.posts);

  const WithPostsState.initial() : posts = const [];

  final List<Post> posts;
}

class PostsLoadingState implements PostsState {
  const PostsLoadingState();
}
