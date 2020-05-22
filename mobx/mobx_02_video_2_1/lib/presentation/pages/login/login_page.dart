import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx02video21/presentation/pages/home/home_page.dart';

import 'mobx/login_page_mobx.dart';

// Mudança da extensão da classe para StatelessWidget
class LoginPage extends StatelessWidget {
// Remoção do override para createState na classe LoginPage
//  @override
//  _LoginPageState createState() => _LoginPageState();
// Retirada do fechamento da chave que existe antes da declaração de _loginPageMobx
//}

// Remoção da linha de definição da classe de estado
//class _LoginPageState extends State<LoginPage> {
  // Implementar logo no início da classe
  final _loginPageMobx = LoginPageMobx();

  // Código a ser implementado logo no início da classe
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

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
              // Código a ser inserido no TextField de email
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              focusNode: _emailNode,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                ),
                hintText: 'Informe o email',
              ),
              // Código a ser inserido no widget TextField de email
              onChanged: (value) => _loginPageMobx.atualizarEmail([value]),
            ),
            // Encapsulamos o Visibility para email em um Observer, widget do flutter_mobx
            Observer(builder: (_) {
              return Visibility(
                visible: !_oEmailEhValido(),
                child:
                    _mensagemDeErro(mensagem: 'Um email correto é obrigatório'),
              );
            }),
            TextField(
              keyboardType: TextInputType.text,
              // Código a ser inserido no TextField de senha
              focusNode: _senhaNode,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.security,
                ),
                hintText: 'Informe a senha',
              ),
              // Código a ser inserido no widget TextField de senha
              onChanged: (value) => _loginPageMobx.atualizarSenha([value]),
            ),
            // Encapsulamos o Visibility para senha em um Observer, widget do flutter_mobx
            Observer(builder: (_) {
              return Visibility(
                visible: !_aSenhaEhValida(),
                child: _mensagemDeErro(mensagem: 'A senha é obritatória'),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              // Encapsulamos o RaisedButton pem um Observer, widget do flutter_mobx
              child: Observer(builder: (_) {
                return RaisedButton(
                  child: Text('Acessar'),
                  // Adaptação do onPressed de RaisedButton para enviar o contexto ao método _oFormularioEhValido
                  onPressed: _oFormularioEhValido(context: context),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Método a ser implementado após o build()
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

  // Métodos a serem implementados após o _mensagemDeErro
  _oEmailEhValido() {
    // Adaptar referência ao valor informado para o email no método _oEmailEhValido
    if (_loginPageMobx.email.value.trim().length == 0) return false;

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    // Adaptar referência ao valor informado para o email no método _oEmailEhValido
    return (regex.hasMatch(_loginPageMobx.email.value));
  }

  _aSenhaEhValida() {
    // Adaptar referência ao valor informado para a senha no método _aSenhaEhValida
    return _loginPageMobx.senha.value.trim().length > 0;
  }

  // Adaptação da assinatura do método _oFormularioEhValido
  _oFormularioEhValido({BuildContext context}) {
    if (_oEmailEhValido() && _aSenhaEhValida()) {
      return () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
    } else {
      return null;
    }
  }
}
