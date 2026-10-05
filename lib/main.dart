import 'package:flutter/material.dart';

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

  // Sección 1: Napolitana
  Widget _buildNapolitana() {
    return const PizzaSection(
      number: 1,
      name: 'Napolitana',
      tagline: 'La clásica',
      description:
          'La favorita de la casa. Salsa de tomate italiano, mozzarella fresca, '
          'hojas de albahaca y un hilo de aceite de oliva sobre masa madre '
          'horneada en leña.',
      image: 'assets/images/img_1.png',
    );
  }

  // Sección 2: Fugazzeta
  Widget _buildFugazzeta() {
    return const PizzaSection(
      number: 2,
      name: 'Fugazzeta',
      tagline: 'Doble queso',
      description:
          'Receta porteña original. Rellena de mozzarella fundida y cubierta de '
          'cebolla dulce, orégano y pimienta recién molida.',
      image: 'assets/images/img_2.png',
    );
  }

  // Sección 3: Formaggio
  Widget _buildFormaggio() {
    return const PizzaSection(
      number: 3,
      name: 'Formaggio',
      tagline: 'Gratinada en leña',
      description:
          'Para los amantes del queso. Mozzarella, parmesano y ricotta '
          'gratinados sobre salsa de tomate, con un toque de chile.',
      image: 'assets/images/img_3.png',
    );
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return _buildNapolitana();
    } else if (_selectedIndex == 1) {
      return _buildFugazzeta();
    } else {
      return _buildFormaggio();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fiamma')),
      drawer: _buildDrawer(),
      body: _buildBody(),
      // Sin destello (ripple) al tocar los botones de la barra.
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _selectSection,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza_outlined),
              activeIcon: Icon(Icons.local_pizza),
              label: 'Napolitana',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza_outlined),
              activeIcon: Icon(Icons.local_pizza),
              label: 'Fugazzeta',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_pizza_outlined),
              activeIcon: Icon(Icons.local_pizza),
              label: 'Formaggio',
            ),
          ],
        ),
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
            _buildDrawerTile(0, 'Napolitana', 'La clásica'),
            _buildDrawerTile(1, 'Fugazzeta', 'Doble queso'),
            _buildDrawerTile(2, 'Formaggio', 'Gratinada en leña'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTile(int index, String title, String subtitle) {
    final selected = index == _selectedIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListTile(
        leading: Icon(
          selected ? Icons.local_pizza : Icons.local_pizza_outlined,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        selected: selected,
        selectedColor: FiammaColors.flame,
        selectedTileColor: FiammaColors.flame.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onTap: () {
          _selectSection(index);
          Navigator.pop(context);
        },
      ),
    );
  }
}
