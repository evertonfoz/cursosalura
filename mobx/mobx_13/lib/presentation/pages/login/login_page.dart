import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx13/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx13/presentation/pages/login/mobx/login_page_store.dart';

import 'mixins/login_page_mixin.dart';

class LoginPage extends StatelessWidget with LoginPageMixin {
  final _loginPageStore = LoginPageStore();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  LoginPage() {
    if (GetIt.I.isRegistered<LoginPageStore>())
      GetIt.I.unregister<LoginPageStore>();
    GetIt.I.registerSingleton<LoginPageStore>(_loginPageStore);
  }

  @override
  Widget build(BuildContext context) {
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
                mensagemDeErro: mensageDeErro(
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
                    funcaoDeCallbackParaSubmissaoDoText(
                  email: _loginPageStore.email,
                  senha: _loginPageStore.senha,
                  buildContext: context,
                ),
                funcaoDeCallbackParaAlteracao: (newValue) =>
                    _loginPageStore.atualizarSenha(newValue: newValue),
                iconeParaPrefixo: Icons.security,
                textoDeAjuda: 'Informe a senha',
                mensagemDeErro: mensageDeErro(
                    valido: aSenhaEhValida(senha: _loginPageStore.senha),
                    mensagem: 'A senha é obritatória'),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: !_loginPageStore.emProcessamento,
                child: RaisedButton(
                  child: Text('Acessar'),
                  onPressed: onPressedParaAcessar(
                    email: _loginPageStore.email,
                    senha: _loginPageStore.senha,
                    context: context,
                  ),
                ),
              ),
              Visibility(
                visible: _loginPageStore.emProcessamento,
                child: Container(
                    color: Colors.indigo,
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Aguarde...',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ],
          );
        }),
      ),
    );
  }
}