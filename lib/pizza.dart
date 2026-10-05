class Pizza {
  const Pizza({
    required this.name,
    required this.tagline,
    required this.description,
    required this.image,
  });

  final String name;
  final String tagline;
  final String description;
  final String image;
}

const pizzas = [
  Pizza(
    name: 'Napolitana',
    tagline: 'La clásica',
    description:
        'La favorita de la casa. Salsa de tomate italiano, mozzarella fresca, '
        'hojas de albahaca y un hilo de aceite de oliva sobre masa madre '
        'horneada en leña.',
    image: 'assets/images/img_1.png',
  ),
  Pizza(
    name: 'Fugazzeta',
    tagline: 'Doble queso',
    description:
        'Receta porteña original. Rellena de mozzarella fundida y cubierta de '
        'cebolla dulce, orégano y pimienta recién molida.',
    image: 'assets/images/img_2.png',
  ),
  Pizza(
    name: 'Formaggio',
    tagline: 'Gratinada en leña',
    description:
        'Para los amantes del queso. Mozzarella, parmesano y ricotta '
        'gratinados sobre salsa de tomate, con un toque de chile.',
    image: 'assets/images/img_3.png',
  ),
];
