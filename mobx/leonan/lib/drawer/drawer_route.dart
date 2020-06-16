import 'package:flutter/material.dart';
import 'package:leonan/drawer/widgets/drawer_body_app.dart';
import 'package:leonan/drawer/widgets/drawer_content_app.dart';
import 'package:leonan/drawer/widgets/drawer_controller_widget.dart';
import 'package:leonan/drawer/widgets/drawer_header_app.dart';
import 'package:leonan/widgets/circular_image_widget.dart';

class DrawerRoute extends StatefulWidget {
  @override
  _DrawerRouteState createState() => _DrawerRouteState();
}

class _DrawerRouteState extends State<DrawerRoute> {
  bool _drawerIsOpen = false;
  double _topBody() {
    return MediaQuery.of(context).size.height - 105;
  }

  double _leftBodyOpen() {
    return 5;
  }

  double _leftBodyClose() {
    return MediaQuery.of(context).size.width - 105;
  }

  @override
  Widget build(BuildContext context) {
    return DrawerControllerWidget(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Jogo da Forca'),
          centerTitle: true,
          actions: <Widget>[
            Icon(
              Icons.menu,
              size: 40,
            )
          ],
        ),
        topBody: _topBody(),
        leftBodyClose: _leftBodyClose(),
        leftBodyOpen: _leftBodyOpen(),
        body: CircularImageWidget(
          imageProvider: AssetImage('assets/images/header.jpg'),
          width: 100,
          heigth: 100,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeaderApp(),
              DrawerBodyApp(
                child: DrawerContentApp(),
              )
            ],
          ),
        ));
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Jogo da Forca',
    //     ),
    //     centerTitle: true,
    //   ),
    //   body: Container(),
    //   drawer: Drawer(
    //     child: Column(
    //       children: <Widget>[
    //         DrawerHeaderApp(),
    //         DrawerBodyApp(child: DrawerContentApp(),),
    //       ],
    //     ),
    //   ),
    // );
  }
}
