import 'package:flutter/material.dart';

import '../../app/hastiq_scope.dart';
import '../../models/user_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final state = HastiqScope.of(context);
    final prefs = state.preferences;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings & Preferences')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Location Filter'),
            subtitle: Text(prefs.location),
            trailing: const Icon(Icons.edit_location_alt),
            onTap: () => state.updatePreferences(
              prefs.copyWith(location: prefs.location == 'Yerevan' ? 'Gyumri' : 'Yerevan'),
            ),
          ),
          ListTile(
            title: const Text('Salary Threshold'),
            subtitle: Text('\$${prefs.salaryThreshold}+'),
            trailing: const Icon(Icons.attach_money),
            onTap: () => state.updatePreferences(
              prefs.copyWith(salaryThreshold: prefs.salaryThreshold + 100),
            ),
          ),
          DropdownButtonFormField<String>(
            value: prefs.jobType,
            decoration: const InputDecoration(labelText: 'Job Type'),
            items: const ['Full-time', 'Part-time', 'Contract']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(growable: false),
            onChanged: (value) {
              if (value == null) return;
              state.updatePreferences(prefs.copyWith(jobType: value));
            },
          ),
          SwitchListTile(
            value: prefs.notifyMatches,
            title: const Text('Match notifications'),
            onChanged: (v) => state.updatePreferences(prefs.copyWith(notifyMatches: v)),
          ),
          SwitchListTile(
            value: prefs.notifyMessages,
            title: const Text('Message notifications'),
            onChanged: (v) => state.updatePreferences(prefs.copyWith(notifyMessages: v)),
          ),
          const Divider(),
          const ListTile(title: Text('Support'), subtitle: Text('In-app help desk (UI placeholder)')),
          ListTile(
            title: const Text('Logout'),
            leading: const Icon(Icons.logout),
            onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
          ),
        ],
      ),
    );
  }
}
