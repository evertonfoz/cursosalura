import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx04/data/datasources/produtos_datasource.dart';
import 'package:mobx04/presentation/pages/home/widgets/listtile_para_produtos_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: listaDeProdutos.length,
          itemBuilder: (context, index) {
            return ListTileParaProdutosWidget(
              produtoModel: listaDeProdutos[index],
            );
          }),
    );
  }
}
