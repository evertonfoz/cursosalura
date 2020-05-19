import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx13/presentation/pages/home/home_page.dart';
import 'package:mobx13/presentation/pages/login/mobx/login_page_store.dart';

mixin LoginPageMixin {
  funcaoDeCallbackParaSubmissaoDoText(
      {bool oFormularioEhValido, BuildContext buildContext}) {
    if (oFormularioEhValido)
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
