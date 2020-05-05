import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx02/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx02/presentation/pages/home/home_page.dart';

import 'mixins/login_page_mixin.dart';
import 'mobx/login_page_mobx.dart';

class LoginPage extends StatelessWidget with LoginPageMixin {
  final _loginPageMobx = LoginPageMobx();

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
                      ? () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      : null), // _formSubmit),
            ],
          );
        }),
      ),
    );
  }
}
