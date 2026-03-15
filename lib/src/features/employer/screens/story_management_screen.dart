import 'package:flutter/material.dart';

import '../../../app/hastiq_scope.dart';

class StoryManagementScreen extends StatelessWidget {
  const StoryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = HastiqScope.of(context).stories;
    return Scaffold(
      appBar: AppBar(title: const Text('Story Management')),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (_, index) {
          final story = stories[index];
          return ListTile(
            leading: CircleAvatar(child: Text(story.companyName.substring(0, 2))),
            title: Text(story.thumbnailLabel),
            subtitle: Text(story.videoCaption),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Upload story (video) flow placeholder')),
          );
        },
        icon: const Icon(Icons.upload),
        label: const Text('Upload Story'),
      ),
    );
  }
}
