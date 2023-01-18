import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'post.g.dart';

@JsonSerializable(createToJson: false)
@HiveType(typeId: 0)
class Post {
  const Post({
    required this.imagePath,
    required this.title,
    required this.text,
    required this.ups,
  });

  @HiveField(1)
  @JsonKey(name: 'thumbnail')
  final String imagePath;

  @HiveField(2)
  @JsonKey(name: 'title')
  final String title;

  @HiveField(3)
  @JsonKey(name: 'selftext')
  final String text;

  @HiveField(4)
  @JsonKey(name: 'ups')
  final int ups;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
