import 'package:flutter/material.dart';
import 'package:mobx01/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx01/presentation/pages/home/home_page.dart';
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
              mensagemDeErro: _mensageDeErro(
                  valido: oEmailEhValido(email: _email),
                  mensagem: 'Um email correto é obrigatório'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              obscureText: true,
              focusNode: _senhaNode,
              textInputAction: TextInputAction.go,
              funcaoDeCallbackParaSubmissaoDoText:
                  (oFormularioEhValido(email: _email, senha: _senha))
                      ? () async => _navegaParaPaginaInicial()
                      : () => FocusScope.of(context).previousFocus(),
              funcaoDeCallbackParaAlteracao: (newValue) {
                setState(() {
                  _senha = newValue;
                });
              },
              iconeParaPrefixo: Icons.security,
              textoDeAjuda: 'Informe a senha',
              mensagemDeErro: _mensageDeErro(
                  valido: aSenhaEhValida(senha: _senha),
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
        ),
      ),
    );
  }

  _mensageDeErro({bool valido, String mensagem}) {
    if (!valido)
      return mensagem;
    else
      return '';
  }

  _onPressedParaAcessar() {
    if (oFormularioEhValido(email: _email, senha: _senha))
      return () async => _navegaParaPaginaInicial();
    else
      return null;
  }

  _navegaParaPaginaInicial() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }
}
