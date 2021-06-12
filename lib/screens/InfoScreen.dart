import 'dart:math';

import 'package:ezstock/widgets/AtributoInfo.dart';
import 'package:ezstock/widgets/ImageCarrousel.dart';
import 'package:flutter/material.dart';
import 'package:ezstock/utils/Magic.dart';

class InfoScreen extends StatefulWidget {
  //TODO: Change to product
  final String item;

  InfoScreen({@required this.item});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final Random random = new Random();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Nome do produto'),
            // title: Text(item.nome),
            actions: [
              IconButton(
                  icon: Icon(Icons.attach_money),
                  onPressed: () => sellDialog(context)),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => Navigator.pushNamed(context, newProductForm,
                    arguments: null),
              ),
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _mostrarDialogoDeletar(context))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRect(
                  child: ImageCarrousel(imgList: itemImages),
                  // child: ImageCarrousel(imgList: item.images),
                  clipBehavior: Clip.hardEdge,
                ),
                Padding(
                  padding: EdgeInsets.all(10.00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtributoInfo('Preço', 'R\$ ' + '69,99'),
                      // AtributoInfo('Preço', 'R\$ ' + item.preco),
                      Divider(color: Colors.grey),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Em estoque',
                              style: TextStyle(
                                  fontSize: screenSize.height * 0.022,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '18' + ' unidades',
                              // item.emEstoque + ' unidades',
                              style: TextStyle(
                                  fontSize: screenSize.height * 0.022,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  addToStockDialog(context);
                                },
                                child: Icon(Icons.add),
                              )),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      AtributoInfo('Vendidos', '3' + ' unidades'),
                      // AtributoInfo('Vendidos', item.vendidos + ' unidades'),
                      Divider(color: Colors.grey),
                      AtributoInfo('Categoria', 'Moletom'),
                      // AtributoInfo('Categoria', item.categoria),
                      Divider(color: Colors.grey),
                      AtributoInfo('Peça nova', 'Sim'),
                      // AtributoInfo('Peça nova', item.ehNova ? 'Sim' : 'Não'),
                      Divider(color: Colors.grey),
                      AtributoInfo('Tamanhos', 'P, M, G'),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _mostrarDialogoDeletar(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deletar Produto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Deseja deletar o produto? Essa ação é irreversível!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                print('Delete');
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> sellDialog(BuildContext context) async {
    int counter = 1;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Marcar como vendido'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                              'Quantas unidades deseja marcar como vendidas?'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: counter >= 2
                                  ? () {
                                      setState(() {
                                        counter--;
                                      });
                                    }
                                  : null,
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              '$counter',
                              style: TextStyle(fontSize: 40),
                            ),
                            IconButton(
                              //TODO: Only allow to sell max the amout in stock
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Sim'),
                  onPressed: () {
                    print('marcar $counter como vendidos');
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> addToStockDialog(BuildContext context) async {
    int counter = 1;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Adicionar no estoque'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                              'Quantas unidades deseja adicionar ao estoque?'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: counter >= 2
                                  ? () {
                                      setState(() {
                                        counter--;
                                      });
                                    }
                                  : null,
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              '$counter',
                              style: TextStyle(fontSize: 40),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Sim'),
                  onPressed: () {
                    print('adicionar $counter em estoque');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  // TODO: remove after api integration
  final List<String> itemImages = [
    'assets/image1.webp',
    'assets/image2.webp',
    'assets/image3.webp'
  ];
}
