import 'package:dio/dio.dart';
import 'package:reddit_test/data/models/posts_data.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/r/flutterdev/new.json')
  Future<PostsData> fetchPosts();
}
