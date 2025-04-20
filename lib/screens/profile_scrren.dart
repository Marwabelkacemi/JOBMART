import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profiles/profile_.jpg'),
            ),
            const SizedBox(height: 20),
            const Text('Fethallah', style: TextStyle(fontSize: 24)),
            const Text('Plombier', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            _buildProfileOption(
              icon: Icons.edit,
              label: 'Modifier le profil',
            ),
            _buildProfileOption(
              icon: Icons.settings,
              label: 'Paramètres',
            ),
            _buildProfileOption(
              icon: Icons.exit_to_app,
              label: 'Déconnexion',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String label,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {},
    );
  }
}