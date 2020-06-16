
import 'package:flutter/material.dart';

class DrawerHeaderApp extends StatelessWidget {
  const DrawerHeaderApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/header.jpg')),
      ),
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Colors.transparent),
        accountName: Text(
          'Leonan Fraga Leonardo',
          style: TextStyle(color: Colors.black),
        ),
        accountEmail: Text(
          'leowc3@gmail.com',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/images/header.jpg'),
        ),
        otherAccountsPictures: <Widget>[
          CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/header.jpg'),
          ),
        ],
      ),
    );
  }
}
