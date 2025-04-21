// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:jobmart/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) toggleTheme;
  
  const HomeScreen({
    super.key,
    required this.toggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeContent(showContactOptions: _showContactOptions),
      const Center(child: Text('Marketplace')),
      const Center(child: Text('Ajouter')),
      const Center(child: Text('Notifications')),
      const Center(child: Text('Profil')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
        onPressed: () => setState(() => _currentIndex = 2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Center(
  child: Text(
    'JobMart',
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      fontWeight: FontWeight.w900, // Épaisseur plus prononcée
      fontStyle: FontStyle.italic, // Ajout d'une légère inclinaison
      letterSpacing: 1.5, // Espacement entre les lettres
      shadows: [
        Shadow(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          blurRadius: 4,
          offset: const Offset(2, 2),
        ),
      ],
      background: Paint()
        ..color = Theme.of(context).colorScheme.surfaceVariant
        ..strokeWidth = 20
        ..style = PaintingStyle.stroke,
    ),
  ),
),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 1,
      actions: [
        IconButton(
          icon: Icon(Icons.settings,
              color: Theme.of(context).colorScheme.primary),
          onPressed: _showSettings,
        ),
        IconButton(
          icon: Icon(Icons.store,
              color: Theme.of(context).colorScheme.primary),
          onPressed: _showMarketplace,
        ),
        _buildMessageButton(),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher...',
              prefixIcon: Icon(Icons.search, 
                  color: Theme.of(context).hintColor),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageButton() {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.message,
              color: Theme.of(context).colorScheme.primary),
          onPressed: _showMessages,
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: const Text(
              '3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  void _showSettings() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Paramètres',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Mode sombre'),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: widget.toggleTheme,
            ),
          ],
        ),
      ),
    );
  }

  void _showMarketplace() {
    setState(() => _currentIndex = 1);
  }

  void _showMessages() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: const Center(child: Text('Messagerie')),
      ),
    );
  }

  void _showContactOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Options de contact',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Envoyer un message'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.call),
              title: const Text('Appeler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final Function(BuildContext) showContactOptions;

  const HomeContent({
    super.key, 
    required this.showContactOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildProductCarousel(),
        Expanded(child: _buildPostList(context)),
      ],
    );
  }

  Widget _buildProductCarousel() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          width: 120,
          margin: EdgeInsets.only(left: index == 0 ? 15 : 0, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/200/300'),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                'Produit ${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostList(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => _buildPostItem(context, index),
    );
  }

  Widget _buildPostItem(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  'https://picsum.photos/400/300?random=$index',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Disponible',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://picsum.photos/200?random=1'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Fethallah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text('Plombier', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => showContactOptions(context),
                  icon: const Icon(Icons.message, size: 16),
                  label: const Text('Contacter'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF673AB7),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text('4.9 (128 avis)', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}