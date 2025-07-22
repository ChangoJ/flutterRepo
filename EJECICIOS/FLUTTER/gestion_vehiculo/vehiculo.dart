import 'taller.dart';

class Vehiculo {
  final String placa;
  String diagnostico = "";
  String estado = "Pendiente";
  dynamic extraInfo;

  Vehiculo(this.placa);

  void registrarDiagnostico(String diagnostico) {
    this.diagnostico = diagnostico;
    estado = "Reparado";
    Taller.incrementarContador();
  }

  void resumen() {
    print("Vehículo: $placa");
    print("Diagnóstico: $diagnostico");
    print("Estado: $estado");
    print("Información Extra: $extraInfo");
    print("Nombre del Taller: ${Taller.nombre}");
    print("Mensaje del Taller: ${Taller.mensajeGeneral}");
    print("------------------------");
  }
}
