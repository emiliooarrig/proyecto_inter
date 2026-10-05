import 'package:flutter/material.dart';

import 'pizza.dart';
import 'pizza_section.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fiamma',
      debugShowCheckedModeBanner: false,
      theme: fiammaTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _selectSection(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fiamma')),
      drawer: _buildDrawer(),
      body: PizzaSection(
        pizza: pizzas[_selectedIndex],
        number: _selectedIndex + 1,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectSection,
        items: [
          for (final pizza in pizzas)
            BottomNavigationBarItem(
              icon: const Icon(Icons.local_pizza_outlined),
              activeIcon: const Icon(Icons.local_pizza),
              label: pizza.name,
            ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/img.png',
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            for (var i = 0; i < pizzas.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListTile(
                  leading: Icon(
                    i == _selectedIndex
                        ? Icons.local_pizza
                        : Icons.local_pizza_outlined,
                  ),
                  title: Text(pizzas[i].name),
                  subtitle: Text(pizzas[i].tagline),
                  selected: i == _selectedIndex,
                  selectedColor: FiammaColors.flame,
                  selectedTileColor: FiammaColors.flame.withValues(alpha: 0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  onTap: () {
                    _selectSection(i);
                    Navigator.pop(context);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
