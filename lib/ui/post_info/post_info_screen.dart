import 'package:flutter/material.dart';
import 'package:reddit_test/data/models/post.dart';

class PostInfoScreen extends StatelessWidget {
  const PostInfoScreen({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о посте'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    post.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  'Ups: ${post.ups}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  post.text,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
