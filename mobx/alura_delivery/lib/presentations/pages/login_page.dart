import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alura - Curso de MobX'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: _emailNode,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Informe o email',
              ),
            ),
            TextField(
              focusNode: _senhaNode,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.security),
                hintText: 'Informe a senha',
              ),
            ),
            RaisedButton(
              child: Text('Acessar'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
