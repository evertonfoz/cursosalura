import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'stores/login_page_store.dart';

class LoginPage extends StatelessWidget {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  // Implementar este código após a definição dos FocusNodes
  final _loginPageStore = LoginPageStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alura - Curso de MobX'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              focusNode: _emailNode,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                ),
                hintText: 'Informe o email',
              ),
              // Atualizar onChanged do TextField de email
              onChanged: (value) =>
                  _loginPageStore.atualizarEmail(newValue: value),
            ),
            Observer(builder: (_) {
              return Visibility(
                // Atualizar o visible do Visibility para mensagem de erro do email
                visible: !_loginPageStore.oEmailEhValido,
                child:
                    _mensagemDeErro(mensagem: 'Um email correto é obrigatório'),
              );
            }),
            TextField(
              keyboardType: TextInputType.text,
              focusNode: _senhaNode,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.security,
                ),
                hintText: 'Informe a senha',
              ),
              // Atualizar onChanged do TextField de senha
              onChanged: (value) =>
                  _loginPageStore.atualizarSenha(newValue: value),
            ),
            Observer(builder: (_) {
              return Visibility(
                // Atualizar o visible do Visibility para mensagem de erro da senha
                visible: !_loginPageStore.aSenhaEhValida,
                child: _mensagemDeErro(mensagem: 'A senha é obritatória'),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Observer(builder: (_) {
                return RaisedButton(
                  child: Text('Acessar'),
                  onPressed: _loginPageStore.oFormularioEhValido,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  _mensagemDeErro({String mensagem}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          mensagem,
          style: TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _onPressedParaBotaoAcessar({BuildContext context}) {
    if (_loginPageStore.oFormularioEhValido)
      return () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
    else
      return null;
  }
}
