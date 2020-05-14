import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx13/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx13/presentation/pages/home/home_page.dart';
import 'package:mobx13/presentation/pages/login/mobx/login_page_store.dart';

import 'mixins/login_page_mixin.dart';

class LoginPage extends StatelessWidget with LoginPageMixin {
  BuildContext _buildContext;
  final _loginPageStore = LoginPageStore();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    _buildContext = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Alura - Curso de MobX'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Observer(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailNode,
                funcaoDeCallbackParaSubmissaoDoText: () =>
                    FocusScope.of(context).nextFocus(),
                funcaoDeCallbackParaAlteracao: (newValue) =>
                    _loginPageStore.atualizarEmail(newValue: newValue),
                iconeParaPrefixo: Icons.email,
                textoDeAjuda: 'Informe o email',
                mensagemDeErro: _mensageDeErro(
                    valido: oEmailEhValido(email: _loginPageStore.email),
                    mensagem: 'Um email correto é obrigatório'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                obscureText: true,
                focusNode: _senhaNode,
                funcaoDeCallbackParaSubmissaoDoText:
                    _funcaoDeCallbackParaSubmissaoDoText(),
                funcaoDeCallbackParaAlteracao: (newValue) =>
                    _loginPageStore.atualizarSenha(newValue: newValue),
                iconeParaPrefixo: Icons.security,
                textoDeAjuda: 'Informe a senha',
                mensagemDeErro: _mensageDeErro(
                    valido: aSenhaEhValida(senha: _loginPageStore.senha),
                    mensagem: 'A senha é obritatória'),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Acessar'),
                onPressed: _onPressedParaAcessar(),
              ),
            ],
          );
        }),
      ),
    );
  }

  _funcaoDeCallbackParaSubmissaoDoText() {
    if (oFormularioEhValido(
        email: _loginPageStore.email, senha: _loginPageStore.senha))
      return () async => _navegaParaPaginaInicial();
    else
      return () => FocusScope.of(_buildContext).previousFocus();
  }

  _mensageDeErro({bool valido, String mensagem}) {
    if (!valido)
      return mensagem;
    else
      return '';
  }

  _onPressedParaAcessar() {
    if (_loginPageStore.oFormularioEhValido)
      return () async => _navegaParaPaginaInicial();
    else
      return null;
  }

  _navegaParaPaginaInicial() async {
    Navigator.push(
      _buildContext,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
