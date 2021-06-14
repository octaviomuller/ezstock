import 'dart:math';

import 'package:ezstock/controllers/controller.dart';
import 'package:ezstock/widgets/AtributoInfo.dart';
import 'package:ezstock/widgets/ImageCarrousel.dart';
import 'package:flutter/material.dart';
import 'package:ezstock/utils/Magic.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  final dynamic item;

  InfoScreen({@required this.item});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final Controller controller = Controller();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.item.product.name),
            // title: Text(item.nome),
            actions: [
              IconButton(
                  icon: Icon(Icons.attach_money),
                  onPressed: () async {
                    await sellDialog(context);
                    try {
                      await controller.postSell(widget.item.id, quantity);
                      Navigator.of(context).pop();
                    } catch (e) {
                      print(e);
                    }
                  }),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => Navigator.pushNamed(context, newProductForm,
                    arguments: null),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await controller.deleteStock(widget.item.id);
                  } catch (e) {
                    print(e);
                  }
                  Navigator.of(context).pushNamed('/');
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRect(
                  child: ImageCarrousel(imgList: widget.item.product.image),
                  // child: ImageCarrousel(imgList: item.images),
                  clipBehavior: Clip.hardEdge,
                ),
                Padding(
                  padding: EdgeInsets.all(10.00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtributoInfo('Preço',
                          'R\$ ' + widget.item.product.price.toString()),
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
                              widget.item.quantity.toString() + ' unidades',
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
                      // AtributoInfo('Vendidos', item.vendidos + ' unidades'),
                      Divider(color: Colors.grey),
                      AtributoInfo('Categoria', widget.item.product.category),
                      // AtributoInfo('Categoria', item.categoria),
                      Divider(color: Colors.grey),
                      AtributoInfo('Peça nova',
                          widget.item.product.used ? 'Sim' : 'Não'),
                      // AtributoInfo('Peça nova', item.ehNova ? 'Sim' : 'Não'),
                      Divider(color: Colors.grey),
                      AtributoInfo('Tamanho', widget.item.product.size),
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
                try {
                  Provider.of<Controller>(context, listen: false)
                      .deleteStock(widget.item.id);
                  Navigator.of(context).pop();
                } catch (e) {
                  print(e);
                }
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
                              onPressed: quantity >= 2
                                  ? () {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  : null,
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(fontSize: 40),
                            ),
                            IconButton(
                              //TODO: Only allow to sell max the amout in stock
                              onPressed: () {
                                setState(() {
                                  quantity++;
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
                    print('marcar $quantity como vendidos');
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
}
