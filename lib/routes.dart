import 'package:flutter/material.dart';
import 'package:jobmart/screens/add_screen.dart';
import 'package:jobmart/screens/home_screen.dart';
import 'package:jobmart/screens/introduction_1.dart';
import 'package:jobmart/screens/introduction_2.dart';
import 'package:jobmart/screens/introduction_3.dart';
import 'package:jobmart/screens/marketplace_screen.dart';
import 'package:jobmart/screens/message_screen.dart';
import 'package:jobmart/screens/notifications_screen.dart';
import 'package:jobmart/screens/profile_scrren.dart';
import 'package:jobmart/screens/setting_screen.dart';

class AppRoutes {
  static const String intro1 = '/intro1';
  static const String intro2 = '/intro2';
  static const String intro3 = '/intro3';
  static const String home = '/home';
  static const String marketplace = '/marketplace';
  static const String add = '/add';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String messages = '/messages';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> get routes {
    return {
      intro1: (context) => const Introduction1Screen(),
      intro2: (context) => const Introduction2Screen(),
      intro3: (context) => const Introduction3Screen(),
      home: (context) => HomeScreen(
            toggleTheme: (isDark) {
              // Fonction vide si vous ne voulez pas gérer le thème
            },
          ),
      marketplace: (context) => const MarketplaceScreen(),
      add: (context) => const AddScreen(),
      notifications: (context) => const NotificationsScreen(),
      profile: (context) => const ProfileScreen(),
      messages: (context) => const MessagesScreen(),
      settings: (context) => const SettingsScreen(),
    };
  }
}