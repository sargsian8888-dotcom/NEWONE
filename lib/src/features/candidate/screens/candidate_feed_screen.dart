import 'package:flutter/material.dart';

import '../../../app/hastiq_scope.dart';
import '../../../models/job.dart';
import '../../../models/story.dart';
import '../../chat/chat_screen.dart';

class CandidateFeedScreen extends StatelessWidget {
  const CandidateFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = HastiqScope.of(context);
    final topJob = state.nextJob;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hastiq Feed'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          _StoriesRow(stories: state.stories),
          Expanded(
            child: topJob == null
                ? const Center(child: Text('No more jobs in your deck.'))
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: _JobCard(job: topJob),
                  ),
          ),
          if (topJob != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ActionButton(
                    icon: Icons.close,
                    color: Colors.red,
                    onTap: () => state.skipJob(topJob),
                  ),
                  _ActionButton(
                    icon: Icons.bookmark,
                    color: Colors.amber,
                    onTap: () {
                      state.saveJob(topJob);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${topJob.title} saved')),
                      );
                    },
                  ),
                  _ActionButton(
                    icon: Icons.favorite,
                    color: Colors.green,
                    onTap: () {
                      final matched = state.applyJob(topJob);
                      if (!matched) return;
                      showDialog<void>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("It's a Match!"),
                          content: Text(
                            '${topJob.companyName} is interested in your profile.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Later'),
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                      title: topJob.companyName,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Open chat'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _StoriesRow extends StatelessWidget {
  const _StoriesRow({required this.stories});

  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          final story = stories[i];
          return InkWell(
            onTap: () => showDialog<void>(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('${story.companyName} Story'),
                content: Text(story.videoCaption),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 26,
                  child: Text(story.companyName.substring(0, 2)),
                ),
                const SizedBox(height: 4),
                Text(story.companyName),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: stories.length,
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  const _JobCard({required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Text(job.companyLogo)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job.companyName,
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                    Text(job.location),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              job.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              job.salaryRange,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(job.description),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: job.requirementTags
                  .map((e) => Chip(label: Text(e)))
                  .toList(growable: false),
            ),
            const Spacer(),
            Text('Type: ${job.jobType}'),
            const Text('Swipe right apply • left skip • up bookmark'),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onTap,
      backgroundColor: color,
      foregroundColor: Colors.white,
      child: Icon(icon),
    );
  }
}
