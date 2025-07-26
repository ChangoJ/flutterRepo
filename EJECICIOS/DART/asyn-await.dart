// Ejercicio 1: Simulación de descarga de archivos
// Situación: Descargar múltiples archivos mientras haces otras tareas

import 'dart:async';
import 'dart:math';

Future<String> descargarArchivo(String nombreArchivo) async {
  int tiempoDescarga = Random().nextInt(3) + 2;
  print('Iniciando descarga de $nombreArchivo...');

  await Future.delayed(Duration(seconds: tiempoDescarga));

  print('$nombreArchivo descargado en ${tiempoDescarga}s');
  return 'Descarga completa: $nombreArchivo';
}

Future<void> hacerOtrasTareas() async {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('Haciendo otra tarea $i...');
  }
}

void main() async {
  Future<String> descarga1 = descargarArchivo('documento.pdf');
  Future<String> descarga2 = descargarArchivo('video.mp4');
  Future<String> descarga3 = descargarArchivo('música.mp3');

  print('Mientras se descargan los archivos, haré otras cosas...\n');
  await hacerOtrasTareas();

  print('\n Esperando que terminen las descargas...');
  List<String> resultados = await Future.wait([
    descarga1,
    descarga2,
    descarga3,
  ]);

  print('\nTODAS LAS DESCARGAS COMPLETADAS:');
  for (String resultado in resultados) {
    print('$resultado');
  }
}
