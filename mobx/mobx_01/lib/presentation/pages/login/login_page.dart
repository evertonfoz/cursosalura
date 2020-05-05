import 'package:flutter/material.dart';
import 'package:mobx01/core/presentation/widgets/textfield_widget.dart';
import 'package:mobx01/presentation/pages/home/home_page.dart';
import 'package:mobx01/presentation/pages/login/mixins/login_page_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  String _email = '';
  String _senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Course - Alura'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              funcaoDeCallbackParaAlteracao: (newValue) {
                setState(() {
                  _email = newValue;
                });
              },
              iconeParaPrefixo: Icons.email,
              textoDeAjuda: 'Informe o email',
              mensagemDeErro:
                  !oEmailEhValido(email: _email) ? 'O email é obrigatório' : '',
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              funcaoDeCallbackParaAlteracao: (newValue) {
                setState(() {
                  _senha = newValue;
                });
              },
              iconeParaPrefixo: Icons.security,
              textoDeAjuda: 'Informe a senha',
              mensagemDeErro:
                  !aSenhaEhValida(senha: _senha) ? 'A senha é obritatória' : '',
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                child: Text('Acessar'),
                onPressed: (oFormularioEhValido(email: _email, senha: _senha))
                    ? () async => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        )
                    : null), // _formSubmit),
          ],
        ),
      ),
    );
  }
}
