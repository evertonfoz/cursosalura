import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx04/data/datasources/produtos_datasource.dart';
import 'package:mobx04/presentation/pages/home/mobx/home_page_store.dart';
import 'package:mobx04/presentation/pages/home/widgets/listtile_para_produtos_widget.dart';
import 'package:numberpicker/numberpicker.dart';

class ListaDeProdutosPage extends StatelessWidget {
  final HomePageStore _homePageStore = GetIt.instance.get<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: listaDeProdutos.length,
        itemBuilder: (context, index) {
          return ListTileParaProdutosWidget(
            produtoModel: listaDeProdutos[index],
            funcaoDeCallbackParaInserirProduto: () async {
              int quantidade = await showDialog<int>(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return NumberPickerDialog.integer(
                    cancelWidget: Text('Cancelar'),
                    confirmWidget: Text('Confirmar'),
                    initialIntegerValue: 1,
                    minValue: 1,
                    maxValue: 10,
                    title: new Text("Quantidade para o item"),
                  );
                },
              );
              if (quantidade != null)
                _homePageStore.registrarProduto(
                    valorProduto: listaDeProdutos[index].valor * quantidade);
            },
          );
        });
  }
}
