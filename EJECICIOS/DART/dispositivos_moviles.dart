abstract class DispositivoElectronico {
  final int codigo;
  final String marca;

  DispositivoElectronico(this.codigo, this.marca);

  void imprimir() {
    print('Código: $codigo');
    print('Marca: $marca');
  }

  void registrarInventario();
}
