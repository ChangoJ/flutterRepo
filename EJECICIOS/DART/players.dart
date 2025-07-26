import 'dart:io';

void main() {
  Map<String, int> rankingJugadores = {'Juan': 100, 'Maria': 85, 'Pedro': 90};

  rankingJugadores['Luis'] = 95;

  print('Jugadores registrados: ${rankingJugadores.keys.join(', ')}');

  rankingJugadores['Maria'] = 88;

  rankingJugadores['Ana'] = 92;

  rankingJugadores.remove('Pedro');

  print('Ranking actualizado:');
  rankingJugadores.forEach((nombre, puntaje) {
    print('$nombre: $puntaje puntos');
  });
}
