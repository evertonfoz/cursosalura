import 'package:flutter/material.dart';
import 'package:mobx01/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx01/presentation/pages/login/mixins/login_page_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  String _email = '';
  String _senha = '';

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
            TextFieldWidget(
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailNode,
              funcaoDeCallbackParaSubmissaoDoText: () =>
                  FocusScope.of(context).nextFocus(),
              funcaoDeCallbackParaAlteracao: (newValue) {
                setState(() {
                  _email = newValue;
                });
              },
              iconeParaPrefixo: Icons.email,
              textoDeAjuda: 'Informe o email',
              mensagemDeErro: mensageDeErro(
                  valido: oEmailEhValido(email: _email),
                  mensagem: 'Um email correto é obrigatório'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              obscureText: true,
              focusNode: _senhaNode,
              funcaoDeCallbackParaSubmissaoDoText:
                  funcaoDeCallbackParaSubmissaoDoText(
                      senha: _senha, email: _email, buildContext: context),
              funcaoDeCallbackParaAlteracao: (newValue) {
                setState(() {
                  _senha = newValue;
                });
              },
              iconeParaPrefixo: Icons.security,
              textoDeAjuda: 'Informe a senha',
              mensagemDeErro: mensageDeErro(
                  valido: aSenhaEhValida(senha: _senha),
                  mensagem: 'A senha é obritatória'),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Acessar'),
              onPressed: onPressedParaAcessar(
                  email: _email, senha: _senha, context: context),
            ),
          ],
        ),
      ),
    );
  }
}
