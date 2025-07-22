class Tienda {
  static const String nombre = "Tienda La Estrella";
  static String anuncio = "¡Ofertas todos los días!";
  static int _productosVendidos = 0;

  static void cambiarAnuncio(String nuevoAnuncio) {
    anuncio = nuevoAnuncio;
  }

  static void aumentarVentas() {
    _productosVendidos++;
  }

  static int obtenerVentas() {
    return _productosVendidos;
  }
}
