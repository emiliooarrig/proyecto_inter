import 'package:flutter/material.dart';

import 'pizza.dart';
import 'theme.dart';

class PizzaSection extends StatelessWidget {
  const PizzaSection({super.key, required this.pizza, required this.number});

  final Pizza pizza;
  final int number;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? _buildPortrait()
            : _buildLandscape(),
      ),
    );
  }

  // Vertical: imagen arriba ocupando todo el ancho, texto debajo.
  Widget _buildPortrait() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Center(child: _PizzaImage(pizza.image))),
          const SizedBox(height: 24),
          _PizzaText(pizza: pizza, number: number),
        ],
      ),
    );
  }

  // Horizontal: imagen a la izquierda a toda la altura, texto a la derecha.
  Widget _buildLandscape() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PizzaImage(pizza.image),
          const SizedBox(width: 32),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: _PizzaText(pizza: pizza, number: number),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PizzaImage extends StatelessWidget {
  const _PizzaImage(this.image);

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}

class _PizzaText extends StatelessWidget {
  const _PizzaText({required this.pizza, required this.number});

  final Pizza pizza;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '0$number  —  ${pizza.tagline.toUpperCase()}',
          style: const TextStyle(
            color: FiammaColors.flame,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          pizza.name,
          style: const TextStyle(
            color: FiammaColors.cream,
            fontFamily: 'serif',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          pizza.description,
          style: TextStyle(
            color: FiammaColors.cream.withValues(alpha: 0.72),
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
