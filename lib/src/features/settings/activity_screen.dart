import 'package:flutter/material.dart';

import '../../app/hastiq_scope.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = HastiqScope.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Tracker')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Applied Jobs (${state.appliedJobs.length})', style: Theme.of(context).textTheme.titleMedium),
          ...state.appliedJobs.map((job) => ListTile(title: Text(job.title), subtitle: Text(job.companyName))),
          const Divider(),
          Text('Saved Jobs (${state.savedJobs.length})', style: Theme.of(context).textTheme.titleMedium),
          ...state.savedJobs.map((job) => ListTile(title: Text(job.title), subtitle: Text(job.companyName))),
          const Divider(),
          Text('Active Matches (${state.matches.length})', style: Theme.of(context).textTheme.titleMedium),
          ...state.matches.map((m) => ListTile(title: Text(m.company), subtitle: Text(m.lastMessage))),
        ],
      ),
    );
  }
}
