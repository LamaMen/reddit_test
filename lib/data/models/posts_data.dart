import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_test/data/models/post.dart';

part 'posts_data.g.dart';

@JsonSerializable(createToJson: false)
class PostsData {
  const PostsData({
    required this.data,
  });

  final PostsDataInfo data;

  factory PostsData.fromJson(Map<String, dynamic> json) =>
      _$PostsDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class PostsDataInfo {
  const PostsDataInfo({
    required this.posts,
  });

  @JsonKey(name: 'children')
  final List<PostInfo> posts;

  factory PostsDataInfo.fromJson(Map<String, dynamic> json) =>
      _$PostsDataInfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PostInfo {
  const PostInfo({
    required this.data,
  });

  @JsonKey(name: 'data')
  final Post data;

  factory PostInfo.fromJson(Map<String, dynamic> json) =>
      _$PostInfoFromJson(json);
}
