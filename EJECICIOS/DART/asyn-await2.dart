import 'dart:async';

Future<String> cocinarPlato(String plato, int minutos) async {
  print('Empezando a cocinar $plato (${minutos} min)...');

  for (int i = 1; i <= minutos; i++) {
    await Future.delayed(Duration(seconds: 1));
    print(' $plato: ${i}/${minutos} min');
  }

  print('$plato está listo\n');
  return plato;
}

Future<void> prepararMesa() async {
  print('Preparando la mesa...');
  await Future.delayed(Duration(seconds: 2));
  print('Mesa preparada\n');
}

Future<void> lavarVegetales() async {
  print('Lavando vegetales...');
  await Future.delayed(Duration(seconds: 3));
  print('Vegetales lavados\n');
}

void main() async {
  Future<String> arrozFuture = cocinarPlato('Arroz', 4);
  Future<String> polloFuture = cocinarPlato('Pollo', 5);
  Future<String> ensaladaFuture = cocinarPlato('Ensalada', 2);

  await prepararMesa();
  await lavarVegetales();

  print('Esperando que terminen todos los platos...\n');

  List<String> platosListos = await Future.wait([
    arrozFuture,
    polloFuture,
    ensaladaFuture,
  ]);

  print('CENA LISTA Platos preparados:');
  for (String plato in platosListos) {
    print('  • $plato');
  }
  print('\nA comer');
}
