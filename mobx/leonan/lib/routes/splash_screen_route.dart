import 'dart:async';

import 'package:flutter/material.dart';
import 'package:leonan/drawer/drawer_route.dart';
import 'package:leonan/routes/welcome_route.dart';
import 'package:leonan/shared_preferences/app_preferences.dart';

import '../widgets/circular_image_widget.dart';

class SplashScreenRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenRoute();
}

class _SplashScreenRoute extends State<SplashScreenRoute> {
  _whereToNavigate({@required bool welcomeRead}) {
    if (welcomeRead)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DrawerRoute()));
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomeRoute()));
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppPreferences.getWelcomeRead().then((status) async {
          await _whereToNavigate(welcomeRead: status);
        });
      });
    });
    // Timer(Duration(seconds: 3), () {
    //   AppPreferences.getWelcomeRead().then((status) {
    //     _whereToNavigate(welcomeRead: status);
    //   });
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => WelcomeRoute()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularImageWidget(
          imageProvider: AssetImage('assets/images/splashscreen.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
          child: Text(
            'Aguarde ...',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: LinearProgressIndicator(
            backgroundColor: Colors.blue[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[900]),
          ),
        ),
      ],
    );
  }
}
