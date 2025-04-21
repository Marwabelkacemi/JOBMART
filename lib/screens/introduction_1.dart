// ignore_for_file: deprecated_member_use

import 'dart:math';

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
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _gradientAnimation;
  late Animation<Offset> _particleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _sizeAnimation = Tween<double>(begin: 220, end: 320).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutQuad,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0.4, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.1416).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCirc,
      ),
    );

    _gradientAnimation = ColorTween(
      begin: Colors.blue.withOpacity(0.6),
      end: const Color.fromARGB(255, 81, 40, 193).withOpacity(0.8),
    ).animate(_controller);

    _particleAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(2.5, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutQuad,
    ));

    Future.delayed(const Duration(seconds: 5), () {
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

  Widget _buildAnimatedParticles() {
    return Stack(
      children: List.generate(8, (index) {
        final angle = (index / 8) * 2 * 3.1416;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                _particleAnimation.value.dx * 50 * cos(angle),
                _particleAnimation.value.dy * 50 * sin(angle),
              ),
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _gradientAnimation.value?.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Cercle principal avec effets combinés
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Container(
                    width: _sizeAnimation.value,
                    height: _sizeAnimation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          _gradientAnimation.value!,
                          _gradientAnimation.value!.withOpacity(0.3),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: _gradientAnimation.value!.withOpacity(0.2),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _buildAnimatedParticles(),
                        Transform.scale(
                          scale: 1 + (_controller.value * 0.1),
                          child: const Text(
                            'JobMart',
                            style: TextStyle(
                              fontFamily: 'Poppins_Italic',
                              fontSize: 34,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Bouton "Commencer plus tard" (inchangé)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.intro2),
                child: Text(
                  'Commencer plus tard',
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.6),
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