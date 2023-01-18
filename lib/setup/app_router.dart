import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit_test/data/models/post.dart';
import 'package:reddit_test/ui/post_info/post_info_screen.dart';
import 'package:reddit_test/ui/posts/posts_screen.dart';

part 'app_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: PostsScreen, initial: true),
    AutoRoute(page: PostInfoScreen),
  ],
)
class AppRouter extends _$AppRouter {}
