import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_test/data/models/post.dart';
import 'package:reddit_test/setup/app_router.dart';
import 'package:reddit_test/setup/injection.dart';
import 'package:reddit_test/ui/posts/bloc/bloc.dart';

class PostsScreen extends StatefulWidget implements AutoRouteWrapper {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (_) => getIt<PostsBloc>(),
      child: this,
    );
  }
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(const UpdatePosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Последние посты'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final posts = (state as WithPostsState).posts;
          return _PostsList(posts: posts);
        },
      ),
    );
  }
}

class _PostsList extends StatelessWidget {
  const _PostsList({required this.posts});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PostsBloc>().add(const UpdatePosts());
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(),
          itemCount: posts.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () => context.router.push(PostInfoRoute(post: posts[i])),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: posts[i].imagePath,
                      placeholder: (_, __) => const SizedBox.shrink(),
                      errorWidget: (_, __, ___) => const SizedBox.shrink(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        posts[i].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
