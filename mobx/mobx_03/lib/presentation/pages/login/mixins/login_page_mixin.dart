import 'package:flutter/material.dart';
import 'package:mobx03/presentation/pages/home/home_page.dart';

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
    Navigator.push(
      buildContext,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
