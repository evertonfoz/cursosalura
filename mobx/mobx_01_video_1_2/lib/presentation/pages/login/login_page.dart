import 'package:flutter/material.dart';
import 'package:mobx01/presentation/pages/login/mixins/login_page_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
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
//            TextField(
//              keyboardType: TextInputType.emailAddress,
//              textInputAction: TextInputAction.next,
//              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
//              focusNode: _emailNode,
//              decoration: InputDecoration(
//                prefixIcon: Icon(
//                  Icons.email,
//                ),
//                hintText: 'Informe o email',
//                contentPadding: const EdgeInsets.only(
//                  left: 30.0,
//                  right: 0,
//                  top: 11,
//                  bottom: 11,
//                ),
//              ),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Icon(
//                  Icons.arrow_forward_ios,
//                  color: Colors.red,
//                  size: 12,
//                ),
//                Text(
//                  'Um email correto é obrigatório',
//                  style: TextStyle(
//                    color: Colors.red,
//                    fontSize: 12,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ],
//            ),
//            SizedBox(
//              height: 10,
//            ),
//            TextField(
//              keyboardType: TextInputType.text,
//              textInputAction: TextInputAction.next,
//              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
//              focusNode: _senhaNode,
//              decoration: InputDecoration(
//                prefixIcon: Icon(
//                  Icons.security,
//                ),
//                hintText: 'Informe a senha',
//                contentPadding: const EdgeInsets.only(
//                  left: 30.0,
//                  right: 0,
//                  top: 11,
//                  bottom: 11,
//                ),
//              ),
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Icon(
//                  Icons.arrow_forward_ios,
//                  color: Colors.red,
//                  size: 12,
//                ),
//                Text(
//                  'A senha é obritatória',
//                  style: TextStyle(
//                    color: Colors.red,
//                    fontSize: 12,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ],
//            ),
//            SizedBox(
//              height: 20,
//            ),
//            RaisedButton(
//              child: Text('Acessar'),
//              onPressed: () {},
//            ),
          ],
        ),
      ),
    );
  }
}
