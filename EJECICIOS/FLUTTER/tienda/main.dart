import 'producto.dart';
import 'tienda.dart';

void main() {
  Producto producto1 = Producto("P001");
  Producto producto2 = Producto("P002");

  producto1.registrarVenta("Camiseta Azul", 25.99, "Talla M");
  producto2.registrarVenta("Pantalón Negro", 45.50, 2);

  Tienda.cambiarAnuncio("¡Descuentos de fin de semana!");

  producto1.resumen();
  producto2.resumen();

  print("Total de productos vendidos: ${Tienda.obtenerVentas()}");
}
