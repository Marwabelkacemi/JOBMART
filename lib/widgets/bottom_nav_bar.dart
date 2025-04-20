import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context: context,
            icon: Icons.home,
            index: 0,
          ),
          _buildNavItem(
            context: context,
            icon: Icons.store,
            index: 1,
          ),
          const SizedBox(width: 40),
          _buildNavItem(
            context: context,
            icon: Icons.notifications,
            index: 3,
          ),
          _buildNavItem(
            context: context,
            icon: Icons.person,
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required int index,
  }) {
    return IconButton(
      icon: Icon(icon),
      color: currentIndex == index
          ? Theme.of(context).colorScheme.primary
          : Colors.grey,
      onPressed: () => onTap(index),
    );
  }
}