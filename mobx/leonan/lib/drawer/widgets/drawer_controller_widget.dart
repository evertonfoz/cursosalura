import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leonan/drawer/blocs/drawer_bloc.dart';
import 'package:leonan/drawer/blocs/drawer_bloc_enums.dart';

class DrawerControllerWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget body;
  final double topBody;
  final double leftBodyOpen;
  final double leftBodyClose;
  final Drawer drawer;
  final Function callbackFunction;
  DrawerControllerWidget(
      {this.appBar,
      this.body,
      this.topBody,
      this.leftBodyOpen,
      this.leftBodyClose,
      this.drawer,
      this.callbackFunction});

  GlobalKey<DrawerControllerState> drawerKey =
      GlobalKey<DrawerControllerState>();
  BuildContext context;

  void _openDrawer() {
    drawerKey.currentState.open();
  }

  void _drawerCallback(final bool status) {
    BlocProvider.of<DrawerOpenStateBloc>(this.context)
        .add(status ? DrawerControllerEvent.open : DrawerControllerEvent.close);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: appBar == null
                ? AppBar()
                : AppBar(
                    automaticallyImplyLeading: appBar.automaticallyImplyLeading,
                    title: appBar.title,
                    centerTitle: appBar.centerTitle,
                    actions: <Widget>[
                      GestureDetector(
                        child: appBar.actions[0],
                        onTap: () => _openDrawer(),
                      )
                    ],
                  ),
          ),
          (this.topBody != null)
              ? BlocBuilder<DrawerOpenStateBloc, bool>(
                  builder: (context, isDrawerOpen) {
                  double left =
                      isDrawerOpen ? this.leftBodyOpen : this.leftBodyClose;
                  return AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    top: this.topBody,
                    left: left,
                    child: body ?? Container(),
                  );
                })
              : body,
          DrawerController(
            key: drawerKey,
            alignment: DrawerAlignment.end,
            child: drawer ?? Container(),
            drawerCallback: (status) => _drawerCallback(status),
          ),
        ],
      ),
    );
  }
}
