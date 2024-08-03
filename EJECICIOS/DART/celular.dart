import 'computador.dart';
import 'dispositivos_moviles.dart';

class Celular extends DispositivoElectronico {
  Celular(int codigo, String marca) : super(codigo, marca);

  @override
  void imprimir() {
    print('Código: $codigo');
    print('Marca: $marca');
  }

  @override
  void registrarInventario() {
    print('Registrando inventario de Celular');
    imprimir();
  }
}

void main() {
  final computador = Computador(512, 123, 'HP');
  final celular = Celular(456, 'Samsung');

  computador.registrarInventario();
  celular.registrarInventario();
}
