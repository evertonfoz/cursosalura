import 'package:flutter/material.dart';
import 'package:leonan/app_constants/router_constants.dart';
import 'package:leonan/widgets/list_tile_app_widget.dart';

class DrawerContentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTileTheme(
          contentPadding: EdgeInsets.only(left: 6.0),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/header.jpg'),
            ),
            title: Text(
              'Base de Palavras',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            onExpansionChanged: null,
            children: <Widget>[
              ListTileAppWidget(
                  titleText: 'Novas Palavras',
                  subtitleText: 'Vamos inserir palavras?',
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(kPalavrasCRUDRoute);
                  }),
              ListTileAppWidget(
                titleText: 'Palavras existentes',
                subtitleText: 'Vamos ver as que já temos?',
                onTap: () => {},
              ),
            ],
          ),
        ),
        _createListTile(
          contentPadding: EdgeInsets.only(left: 6.0),
          titleText: 'Jogar',
          subtitleText: 'Começar a diversão',
          avatarImage: AssetImage('assets/images/header.jpg'),
        ),
        _createListTile(
          contentPadding: EdgeInsets.only(left: 6.0),
          titleText: 'Score',
          subtitleText: 'relação dos top 10',
          avatarImage: AssetImage('assets/images/header.jpg'),
        ),
      ],
    );
  }

  ListTile _createListTile({
    @required EdgeInsets contentPadding,
    ImageProvider avatarImage,
    @required String titleText,
    @required String subtitleText,
  }) {
    return ListTile(
      contentPadding: contentPadding,
      leading: avatarImage != null
          ? CircleAvatar(
              backgroundImage: avatarImage,
            )
          : null,
      trailing: Icon(Icons.arrow_forward),
      title: Text(titleText),
      subtitle: Text(subtitleText),
      onTap: () {},
    );
  }
}
