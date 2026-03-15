import 'package:flutter/material.dart';

import 'employer_dashboard_screen.dart';
import 'job_posting_screen.dart';
import 'story_management_screen.dart';
import 'monetization_screen.dart';

class EmployerShell extends StatefulWidget {
  const EmployerShell({super.key});

  @override
  State<EmployerShell> createState() => _EmployerShellState();
}

class _EmployerShellState extends State<EmployerShell> {
  int _index = 0;

  static const _pages = [
    EmployerDashboardScreen(),
    JobPostingScreen(),
    StoryManagementScreen(),
    MonetizationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.work), label: 'Post Job'),
          NavigationDestination(icon: Icon(Icons.video_collection), label: 'Stories'),
          NavigationDestination(icon: Icon(Icons.insights), label: 'Growth'),
        ],
      ),
    );
  }
}
