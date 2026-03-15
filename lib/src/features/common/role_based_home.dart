import 'package:flutter/material.dart';

import '../../app/app_state.dart';
import '../../app/hastiq_scope.dart';
import '../candidate/screens/candidate_shell.dart';
import '../employer/screens/employer_shell.dart';

class RoleBasedHome extends StatelessWidget {
  const RoleBasedHome({super.key});

  @override
  Widget build(BuildContext context) {
    final state = HastiqScope.of(context);
    switch (state.role) {
      case UserRole.candidate:
        return const CandidateShell();
      case UserRole.employer:
        return const EmployerShell();
      case null:
        return const SizedBox.shrink();
    }
  }
}
