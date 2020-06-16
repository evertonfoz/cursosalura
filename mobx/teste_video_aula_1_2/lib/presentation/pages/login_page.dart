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
        title: Text('Alura Delivery'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailNode,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                prefix: Icon(Icons.email),
                hintText: 'Informe o email',
              ),
            ),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              focusNode: _senhaNode,
              decoration: InputDecoration(
                prefix: Icon(Icons.security),
                hintText: 'Informe a senha',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
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
