mixin LoginPageMixin {
  oEmailEhValido({String email}) {
    if (email.trim().length == 0) return false;

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(email));
  }

  aSenhaEhValida({String senha}) {
    return senha.trim().length > 0;
  }

  oFormularioEhValido({String email, String senha}) {
    return (oEmailEhValido(email: email) && aSenhaEhValida(senha: senha));
  }
}
