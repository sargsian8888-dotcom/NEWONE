import 'package:flutter/material.dart';

import '../../app/app_state.dart';
import '../../app/hastiq_scope.dart';
import '../common/role_based_home.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.role});

  final UserRole role;

  @override
  Widget build(BuildContext context) {
    final roleTitle = role == UserRole.candidate ? 'Candidate' : 'Employer';
    return Scaffold(
      appBar: AppBar(title: Text('Continue as $roleTitle')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Sign up / Login', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.g_mobiledata), label: const Text('Continue with Google')),
            const SizedBox(height: 10),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.apple), label: const Text('Continue with Apple ID')),
            const SizedBox(height: 10),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.phone), label: const Text('Continue with Phone (OTP)')),
            const Spacer(),
            FilledButton(
              onPressed: () {
                HastiqScope.of(context).selectRole(role);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const RoleBasedHome()),
                  (_) => false,
                );
              },
              child: const Text('Mock authentication complete'),
            ),
          ],
        ),
      ),
    );
  }
}
