mixin LoginPageMixin {
  oEmailEhValido({String email}) {
    return email.trim().length > 0;
  }

  aSenhaEhValida({String senha}) {
    return senha.trim().length > 0;
  }

  oFormularioEhValido({String email, String senha}) {
    return (oEmailEhValido(email: email) && aSenhaEhValida(senha: senha));
  }
}
