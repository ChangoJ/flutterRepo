import 'dart:io';

void main() {
  List<String> comidaFavoritas = [
    'Spaghetti',
    'Tacos',
    'Sushi',
    'Pizza',
    'Hamburguesa',
  ];

  comidaFavoritas.add('Enchiladas');

  comidaFavoritas.remove('Sushi');

  print('Comida en posición 2: ${comidaFavoritas[1]}');

  List<List<String>> menuSemanal = [
    ['Cereal', 'Huevos', 'Sopa'],
    ['Fruta', 'Pollo', 'Ensalada'],
    ['Yogur', 'Pasta', 'Arroz'],
    ['Pan', 'Carne', 'Verduras'],
    ['Jugo', 'Pescado', 'Lasagna'],
  ];

  print('Almuerzo de Martes: ${menuSemanal[1][1]}');

  menuSemanal[4][2] = 'Tortilla';

  print('Menú Semanal:');
  for (int i = 0; i < menuSemanal.length; i++) {
    print('Día ${i + 1}: ${menuSemanal[i].join(', ')}');
  }
}
