import 'tienda.dart';

class Producto {
  final String codigo;
  String descripcion = "";
  double precio = 0.0;
  dynamic observacion;

  Producto(this.codigo);

  void registrarVenta(String descripcion, double precio, dynamic observacion) {
    this.descripcion = descripcion;
    this.precio = precio;
    this.observacion = observacion;
    Tienda.aumentarVentas();
  }

  void resumen() {
    print("Producto: $codigo");
    print("Descripción: $descripcion");
    print("Precio: \$${precio}");
    print("Observación: $observacion");
    print("Nombre de la Tienda: ${Tienda.nombre}");
    print("Anuncio de la Tienda: ${Tienda.anuncio}");
    print("------------------------");
  }
}
