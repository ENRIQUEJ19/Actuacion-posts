class Posts {
  final int id;
  final String autor;
  final String comentario;
  final String privacidad;
  final String visualizacion;
  bool read;

  Posts({
    required this.id,
    required this.autor,
    required this.comentario,
    required this.privacidad,
    required this.visualizacion,
    this.read = false,
  });
}
