import 'package:flutter/material.dart';

import '../../app/app_state.dart';
import 'auth_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose your role')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _RoleCard(
              title: 'I am looking for a job',
              subtitle: 'Candidate',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AuthScreen(role: UserRole.candidate),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _RoleCard(
              title: 'I am looking for talent',
              subtitle: 'Employer',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AuthScreen(role: UserRole.employer),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
