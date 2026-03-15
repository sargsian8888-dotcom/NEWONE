import 'package:flutter/material.dart';

class JobPostingScreen extends StatefulWidget {
  const JobPostingScreen({super.key});

  @override
  State<JobPostingScreen> createState() => _JobPostingScreenState();
}

class _JobPostingScreenState extends State<JobPostingScreen> {
  final _title = TextEditingController();
  final _skills = TextEditingController();
  final _description = TextEditingController();
  final _salary = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _skills.dispose();
    _description.dispose();
    _salary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post a Job')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: _title, decoration: const InputDecoration(labelText: 'Job Title')),
          TextField(controller: _skills, decoration: const InputDecoration(labelText: '3 Must-have Skills')),
          TextField(controller: _description, decoration: const InputDecoration(labelText: 'Short Description')),
          TextField(controller: _salary, decoration: const InputDecoration(labelText: 'Salary Range')),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Job posted (mock flow)')),
              );
            },
            child: const Text('Publish Job'),
          ),
        ],
      ),
    );
  }
}
