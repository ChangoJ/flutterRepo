import 'dispositivos_moviles.dart';

class Computador extends DispositivoElectronico {
  final int capacidadDisco;

  Computador(this.capacidadDisco, int codigo, String marca)
      : super(codigo, marca);

  @override
  void imprimir() {
    super.imprimir();
    print('Capacidad de disco: $capacidadDisco GB');
  }

  @override
  void registrarInventario() {
    print('Registrando inventario de Computador');
    imprimir();
  }
}
