import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx13/presentation/pages/home/home_page.dart';
import 'package:mobx13/presentation/pages/login/mobx/login_page_store.dart';

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

  funcaoDeCallbackParaSubmissaoDoText(
      {String email, String senha, BuildContext buildContext}) {
    if (oFormularioEhValido(email: email, senha: senha))
      return () async => navegaParaPaginaInicial(buildContext: buildContext);
    else
      return () => FocusScope.of(buildContext).previousFocus();
  }

  mensageDeErro({bool valido, String mensagem}) {
    if (!valido)
      return mensagem;
    else
      return '';
  }

  onPressedParaAcessar({String email, String senha, BuildContext context}) {
    if (oFormularioEhValido(email: email, senha: senha))
      return () async => navegaParaPaginaInicial(buildContext: context);
    else
      return null;
  }

  navegaParaPaginaInicial({BuildContext buildContext}) async {
    GetIt.I.get<LoginPageStore>().atualizarEmProcessamento(newValue: true);
    await Navigator.push(
      buildContext,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
    GetIt.I.get<LoginPageStore>().atualizarEmProcessamento(newValue: false);
//    GetIt.I.unregister<LoginPageStore>();
  }
}
