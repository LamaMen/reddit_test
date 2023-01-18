import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:reddit_test/data/api/api_provider.dart';
import 'package:reddit_test/data/models/post.dart';

const _postsBox = 'posts_box';

@singleton
class PostsRepository {
  const PostsRepository(this._provider);

  final ApiProvider _provider;

  Future<List<Post>> getPosts() async {
    final client = _provider.getApi();
    try {
      // fetch data
      final data = await client.fetchPosts();
      final postsData = data.data.posts;
      final posts = postsData.map((p) => p.data).toList();

      // clear saved data and add fetched
      final box = await Hive.openBox<Post>(_postsBox);
      await box.clear();
      box.addAll(posts);

      return posts;
    } on DioError {
      // get data from cache
      final box = await Hive.openBox<Post>(_postsBox);
      final items = box.values;
      return items.toList();
    }
  }
}
