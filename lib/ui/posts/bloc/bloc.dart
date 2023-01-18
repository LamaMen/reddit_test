import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reddit_test/data/models/post.dart';
import 'package:reddit_test/data/repository/posts_repository.dart';

part 'event.dart';

part 'state.dart';

@injectable
class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc(this._repository) : super(const WithPostsState.initial()) {
    on<UpdatePosts>(_onUpdatePosts);
  }

  final PostsRepository _repository;

  Future<void> _onUpdatePosts(UpdatePosts event, Emitter emit) async {
    emit(const PostsLoadingState());
    final posts = await _repository.getPosts();
    emit(WithPostsState(posts));
  }
}
