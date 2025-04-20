import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/profiles/profile_.jpg'),
          ),
          title: Text('Contact ${index + 1}'),
          subtitle: const Text('Dernier message échangé...'),
          trailing: const Text('12:30 PM'),
          onTap: () {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {},
      ),
    );
  }
}