// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Messages',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: colorScheme.primary,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(
          color: colorScheme.surface.withOpacity(0.5),
          height: 1,
        ),
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: colorScheme.primary.withOpacity(0.2),
            child: Icon(
              Icons.person_outline,
              color: colorScheme.primary,
            ),
          ),
          title: Text(
            'Contact ${index + 1}',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            'Dernier message échangé...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
          ),
          trailing: Text(
            '12:30 PM',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
          ),
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