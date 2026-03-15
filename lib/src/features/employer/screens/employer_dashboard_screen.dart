import 'package:flutter/material.dart';

import '../../../app/hastiq_scope.dart';

class EmployerDashboardScreen extends StatelessWidget {
  const EmployerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = HastiqScope.of(context);
    final candidate = state.nextCandidate;

    return Scaffold(
      appBar: AppBar(title: const Text('Employer Panel')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _DashboardSummary(),
          Expanded(
            child: candidate == null
                ? const Center(child: Text('No candidate applications to review'))
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(candidate.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(candidate.jobTitle),
                            const SizedBox(height: 8),
                            Text(candidate.bio),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              children: candidate.skills.map((s) => Chip(label: Text(s))).toList(growable: false),
                            ),
                            const SizedBox(height: 12),
                            Text(candidate.educationSummary),
                            Text(candidate.portfolioLink),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () {
                                    state.reviewCandidate(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Declined ${candidate.name}')),
                                    );
                                  },
                                  icon: const Icon(Icons.close),
                                  label: const Text('Decline'),
                                ),
                                FilledButton.icon(
                                  onPressed: () {
                                    state.reviewCandidate(true);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Matched with ${candidate.name}')),
                                    );
                                  },
                                  icon: const Icon(Icons.favorite),
                                  label: const Text('Match'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _DashboardSummary extends StatelessWidget {
  const _DashboardSummary();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Today', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MetricTile(label: 'Active Jobs', value: '3'),
              _MetricTile(label: 'New Applicants', value: '24'),
              _MetricTile(label: 'Matches', value: '8'),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
        Text(label),
      ],
    );
  }
}
