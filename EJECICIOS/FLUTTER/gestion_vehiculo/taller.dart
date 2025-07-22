class Taller {
  static const String nombre = "Taller Automotriz El Rayo";
  static String mensajeGeneral = "¡Bienvenido al mejor taller de la ciudad!";
  static int _totalReparaciones = 0;

  static void cambiarMensaje(String nuevoMensaje) {
    mensajeGeneral = nuevoMensaje;
  }

  static void incrementarContador() {
    _totalReparaciones++;
  }

  static int obtenerReparaciones() {
    return _totalReparaciones;
  }
}
