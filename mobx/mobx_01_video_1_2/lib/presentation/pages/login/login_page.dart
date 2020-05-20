import 'package:flutter/material.dart';
import 'package:mobx01/presentation/pages/login/mixins/login_page_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
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
            ),
            TextField(
              keyboardType: TextInputType.text,
//              textInputAction: TextInputAction.next,
//              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              // Código a ser inserido no TextField de senha
              focusNode: _senhaNode,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.security,
                ),
                hintText: 'Informe a senha',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: RaisedButton(
                child: Text('Acessar'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
