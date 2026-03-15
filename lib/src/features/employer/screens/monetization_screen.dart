import 'package:flutter/material.dart';

class MonetizationScreen extends StatelessWidget {
  const MonetizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monetization & Analytics')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text('Pay-per-Match'),
              subtitle: Text('Unlock chat sessions after a match.'),
              trailing: Text('\$4.99'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Candidate Boost'),
              subtitle: Text('Prioritize candidate profile in employer triage.'),
              trailing: Text('\$2.99'),
            ),
          ),
          SizedBox(height: 20),
          Text('Analytics Snapshot', style: TextStyle(fontWeight: FontWeight.bold)),
          ListTile(title: Text('Swipe-to-Match Ratio'), trailing: Text('31%')),
          ListTile(title: Text('D1 Retention'), trailing: Text('44%')),
          ListTile(title: Text('Weekly Active Employers'), trailing: Text('127')),
        ],
      ),
    );
  }
}
