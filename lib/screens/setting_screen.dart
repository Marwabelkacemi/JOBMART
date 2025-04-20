import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Mode sombre'),
            value: false,
            onChanged: (value) {},
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          const ListTile(
            leading: Icon(Icons.security),
            title: Text('Confidentialité'),
          ),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text('Aide'),
          ),
        ],
      ),
    );
  }
}