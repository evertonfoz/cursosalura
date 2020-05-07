import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx02/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx02/presentation/pages/home/home_page.dart';

import 'mixins/login_page_mixin.dart';
import 'mobx/login_page_mobx.dart';

class LoginPage extends StatelessWidget with LoginPageMixin {
  final _loginPageMobx = LoginPageMobx();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Course - Alura'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                focusNode: _emailNode,
                funcaoDeCallbackParaSubmissaoDoText: () =>
                    FocusScope.of(context).nextFocus(),
                funcaoDeCallbackParaAlteracao: _loginPageMobx.atualizarEmail,
                iconeParaPrefixo: Icons.email,
                textoDeAjuda: 'Informe o email',
                mensagemDeErro:
                    !oEmailEhValido(email: _loginPageMobx.email.value)
                        ? 'O email é obrigatório'
                        : '',
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                textInputAction: TextInputAction.go,
                focusNode: _senhaNode,
                funcaoDeCallbackParaSubmissaoDoText: oFormularioEhValido(
                        email: _loginPageMobx.email.value,
                        senha: _loginPageMobx.senha.value)
                    ? () async => navegaParaPaginaInicial(context: context)
                    : () => FocusScope.of(context).previousFocus(),
                funcaoDeCallbackParaAlteracao: _loginPageMobx.atualizarSenha,
                iconeParaPrefixo: Icons.security,
                textoDeAjuda: 'Informe a senha',
                mensagemDeErro:
                    !aSenhaEhValida(senha: _loginPageMobx.senha.value)
                        ? 'A senha é obritatória'
                        : '',
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text('Acessar'),
                  onPressed: oFormularioEhValido(
                          email: _loginPageMobx.email.value,
                          senha: _loginPageMobx.senha.value)
                      ? () async => navegaParaPaginaInicial(context: context)
                      : null), // _formSubmit),
            ],
          );
        }),
      ),
    );
  }

  navegaParaPaginaInicial({BuildContext context}) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
