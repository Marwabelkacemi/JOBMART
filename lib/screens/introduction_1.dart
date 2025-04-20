import 'package:flutter/material.dart';
import 'package:jobmart/routes.dart';

class Introduction1Screen extends StatefulWidget {
  const Introduction1Screen({super.key});

  @override
  State<Introduction1Screen> createState() => _Introduction1ScreenState();
}

class _Introduction1ScreenState extends State<Introduction1Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Délai de 4 secondes avant la navigation
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.intro2);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Cercle animé bleu avec "JobMart"
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  width: _animation.value,
                  height: _animation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(
                      0.3 + 0.3 * (_animation.value - 220) / 60,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'JobMart',
                      style: TextStyle(
                        fontFamily: 'Poppins_Italic',
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bouton "Commencer plus tard"
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/intro2'),
                child: Text(
                  'Commencer plus tard',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
