import 'package:flutter/material.dart';

import '../../app/hastiq_scope.dart';

class ProfileEditorScreen extends StatefulWidget {
  const ProfileEditorScreen({super.key});

  @override
  State<ProfileEditorScreen> createState() => _ProfileEditorScreenState();
}

class _ProfileEditorScreenState extends State<ProfileEditorScreen> {
  late final TextEditingController _title;
  late final TextEditingController _bio;
  late final TextEditingController _portfolio;
  late final TextEditingController _skills;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final p = HastiqScope.of(context).profile;
    _title = TextEditingController(text: p.jobTitle);
    _bio = TextEditingController(text: p.bio);
    _portfolio = TextEditingController(text: p.portfolioLink);
    _skills = TextEditingController(text: p.skills.join(', '));
  }

  @override
  void dispose() {
    _title.dispose();
    _bio.dispose();
    _portfolio.dispose();
    _skills.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = HastiqScope.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Editor')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: _title, decoration: const InputDecoration(labelText: 'Job Title')),
          TextField(controller: _bio, decoration: const InputDecoration(labelText: 'Bio')),
          TextField(controller: _portfolio, decoration: const InputDecoration(labelText: 'Portfolio Link')),
          TextField(controller: _skills, decoration: const InputDecoration(labelText: 'Top Skill Tags (comma separated)')),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              state.updateProfile(
                jobTitle: _title.text,
                bio: _bio.text,
                portfolio: _portfolio.text,
                skills: _skills.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
              );
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated')));
            },
            child: const Text('Save Profile'),
          ),
        ],
      ),
    );
  }
}
