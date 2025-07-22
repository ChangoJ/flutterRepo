import 'taller.dart';

class Empleado {
  final String nombre;

  Empleado(this.nombre);

  void actualizarMensajeDelTaller(String nuevoMensaje) {
    Taller.cambiarMensaje(nuevoMensaje);
  }
}
