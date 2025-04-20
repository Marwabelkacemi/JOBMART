import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un nouveau'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAddOption(
              icon: Icons.post_add,
              label: 'Nouvelle annonce',
              onTap: () {},
            ),
            _buildAddOption(
              icon: Icons.work,
              label: 'Nouveau service',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(label, style: const TextStyle(fontSize: 18)),
        onTap: onTap,
      ),
    );
  }
}