import 'servidor_correo.dart';

void main() {
  ServidorCorreo servidor1 = ServidorCorreo();
  ServidorCorreo servidor2 = ServidorCorreo();

  print('Referencias creadas: servidor1 y servidor2\n');

  print('Conectando servidor usando servidor1');
  servidor1.conectar();

  print('Enviando correos');
  servidor1.enviarCorreo('juan@email.com', 'Reunión de trabajo');
  servidor2.enviarCorreo('maria@email.com', 'Informe mensual');

  print('Verificación de instancia única');
  print('¿servidor1 == servidor2?: ${servidor1 == servidor2}');
  print('¿Misma instancia?: ${identical(servidor1, servidor2)}\n');

  print('Estado de conexion');
  print('Estado servidor1.estaConectado: ${servidor1.estaConectado}');
  print('Estado servidor2.estaConectado: ${servidor2.estaConectado}\n');

  print('Prueba adicional: Intentar conectar desde servidor2');
  servidor2.conectar();

  print('Desconectando servidor2');
  servidor2.desconectar();

  print('Estado final');
  print('Estado servidor1.estaConectado: ${servidor1.estaConectado}');
  print('Estado servidor2.estaConectado: ${servidor2.estaConectado}');
}
