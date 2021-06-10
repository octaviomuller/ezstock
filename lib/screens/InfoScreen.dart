import 'dart:math';

import 'package:ezstock/widgets/AtributoInfo.dart';
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
                  child: Image.asset(
                    'assets/image${random.nextInt(9)}.webp',
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    fit: BoxFit.cover,
                  ),
                  clipBehavior: Clip.hardEdge,
                ),
                Padding(
                    padding: EdgeInsets.all(10.00),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AtributoInfo('Preço', 'R\$ ' + '69,99'),
                        Divider(color: Colors.grey),
                        AtributoInfo('Em estoque', '18' + ' unidades'),
                        Divider(color: Colors.grey),
                        AtributoInfo('Vendidos', '3' + ' unidades'),
                        Divider(color: Colors.grey),
                        AtributoInfo('Categoria', 'Moletom'),
                        Divider(color: Colors.grey),
                        AtributoInfo('Peça nova', 'Sim'),
                        Divider(color: Colors.grey),
                        AtributoInfo('Tamanhos', 'P, M, G'),
                      ],
                    )),
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
                              onPressed: () {
                                setState(() {
                                  counter--;
                                });
                              },
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
}
