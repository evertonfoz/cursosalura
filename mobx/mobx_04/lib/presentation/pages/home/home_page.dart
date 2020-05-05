import 'package:flutter/material.dart';
import 'package:mobx04/data/datasources/produtos_datasource.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: listaDeProdutos.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('Foto'),
              ),
            );
          }),
    );
  }
}
