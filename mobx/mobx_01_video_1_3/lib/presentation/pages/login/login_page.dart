import 'package:flutter/material.dart';
import 'package:mobx01video13/presentation/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Código a ser implementado logo no início da classe
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  // Código aser implementado após as declarações dos FocusNodes
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
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            // Código a ser implementado após TextField de email
            // Adaptação para a mensagem de erro do email
            Visibility(
              visible: !_oEmailEhValido(),
              child:
                  _mensagemDeErro(mensagem: 'Um email correto é obrigatório'),
            ),
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
              onChanged: (value) {
                setState(() {
                  _senha = value;
                });
              },
            ),
            // Código a ser implementado após TextField de senha
            // Adaptação para a mensagem de erro da senha
            Visibility(
              visible: !_aSenhaEhValida(),
              child: _mensagemDeErro(mensagem: 'A senha é obritatória'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: RaisedButton(
                child: Text('Acessar'),
                // Adaptação para a propriedade onPressed no RaisedButton
                onPressed: _onPressedParaBotaoAcessar(),
              ),
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
    if (_email.trim().length == 0) return false;

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(_email));
  }

  _aSenhaEhValida() {
    return _senha.trim().length > 0;
  }

  // Método a ser implementado após a validação da senha
  _onPressedParaBotaoAcessar() {
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
