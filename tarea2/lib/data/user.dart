class Usuario{
  String? id;
  String? name;
  String? email;
  String? phone;

  String? _contra;

  Usuario({this.id, this.name, this.email, this.phone});

  set setContra(String contra) {
    _contra = contra;
  }

  bool compararContra(String contra) {
    return _contra == contra;
  }

}

List<Usuario> usuarios = [
  Usuario(id: '1', name: 'Juan Perez', email: 'J.P@unah.hn', phone: '9999-9999'),
  Usuario(id: '2', name: 'Maria Lopez', email: 'M.L@unah.hn', phone: '8888-8888'),
  Usuario(id: '3', name: 'Carlos Sanchez', email: 'C.S@unah.hn', phone: '7777-7777')
];

bool validarEmail(String email) {
  return email.contains('@unah.hn');
}
Usuario obtenerUsuarioPorEmail(String email) {
  return usuarios.firstWhere((usuario) => usuario.email == email, orElse: () => Usuario());
}
Usuario obtenerUsuarioPorId(String id) {
  return usuarios.firstWhere((usuario) => usuario.id == id, orElse: () => Usuario());
}

void agregarUsuario(Usuario usuario) {
  usuarios.add(usuario);
}

void eliminarUsuarioPorId(String id) {
  usuarios.removeWhere((usuario) => usuario.id == id);
}

void actualizarUsuario(Usuario usuarioActualizado) {
  int index = usuarios.indexWhere((usuario) => usuario.id == usuarioActualizado.id);
  if (index != -1) {
    usuarios[index] = usuarioActualizado;
  }
}
