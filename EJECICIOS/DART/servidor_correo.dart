class ServidorCorreo {
  static ServidorCorreo? _instancia;

  bool _conectado = false;

  ServidorCorreo._();

  factory ServidorCorreo() {
    _instancia ??= ServidorCorreo._();
    return _instancia!;
  }

  bool get estaConectado => _conectado;

  void conectar() {
    if (_conectado) {
      print('Ya existe una conexión activa al servidor de correo.');
    } else {
      _conectado = true;
      print('Servidor de correo conectado exitosamente.');
    }
  }

  void enviarCorreo(String destinatario, String asunto) {
    if (_conectado) {
      print('Correo enviado a: $destinatario');
      print('Asunto: $asunto');
      print('Estado: Enviado exitosamente\n');
    } else {
      print(
        'Error: No se puede enviar el correo. El servidor no está conectado.\n',
      );
    }
  }

  void desconectar() {
    if (_conectado) {
      _conectado = false;
      print('Servidor de correo desconectado.');
    } else {
      print('El servidor ya estaba desconectado.');
    }
  }
}
