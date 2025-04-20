import 'package:flutter/material.dart';

class Introduction2Screen extends StatelessWidget {
  const Introduction2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Fond circulaire décoratif
          Positioned(
            right: -150,
            bottom: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              ),
            ),
          ),
          
          // Contenu principal
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image illustrative
                Container(
                  width: 250,
                  height: 250,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/intro2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                // Titre
                Text(
                  'Trouvez les meilleurs talents',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                
                // Bouton de navigation
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () {
                    // Navigation vers l'écran suivant
                    Navigator.pushReplacementNamed(context, '/intro3');
                  },
                  child: Text(
                    'Continuer',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                // Option: Skip button
                TextButton(
                  onPressed: () {
                    // Aller directement à l'accueil
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text(
                    'Passer',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      // Option: Bouton flottant pour navigation
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacementNamed(context, '/intro3'),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}