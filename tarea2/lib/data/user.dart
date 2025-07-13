class Usuario{
  String? id;
  String? name;
  String? email;
  String? phone;

  String? _contra;

  Usuario({this.id, this.name, this.email, this.phone});

  set contra(String contra) {
    _contra = contra;
  }

  bool compararContra(String contra) {
    return _contra == contra;
  }

}

List<Usuario> usuarios = [
  Usuario(id: '1', name: 'Mahonri Flores', email: 'Mahonri.Flores@unah.hn', phone: '9999-9999')
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


void actualizarUsuario(Usuario usuarioActualizado) {
  int index = usuarios.indexWhere((usuario) => usuario.id == usuarioActualizado.id);
  if (index != -1) {
    usuarios[index] = usuarioActualizado;
  }
}
