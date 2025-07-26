import 'dart:io';

class Pelicula {
  final String titulo;
  final int anio;
  Pelicula(this.titulo, this.anio);
}

void main() {
  Map<String, List<Pelicula>> catalogo = {
    'Netflix': [
      Pelicula('Stranger Things', 2016),
      Pelicula('Mindhunter', 2017),
    ],
    'HBO': [Pelicula('Game of Thrones', 2011), Pelicula('Euphoria', 2019)],
    'Disney+': [Pelicula('Luca', 2021), Pelicula('Encanto', 2021)],
  };

  catalogo['Disney+']?.add(Pelicula('Elemental', 2023));

  print(
    'Películas en HBO: ${catalogo['HBO']?.map((p) => p.titulo).join(', ')}',
  );

  catalogo['Netflix']?.removeWhere((p) => p.titulo == 'Mindhunter');

  print('Catálogo de Películas:');
  catalogo.forEach((plataforma, peliculas) {
    print('$plataforma:');
    for (var pelicula in peliculas) {
      print('  ${pelicula.titulo} (${pelicula.anio})');
    }
  });
}
