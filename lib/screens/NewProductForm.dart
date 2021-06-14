import 'dart:io';

import 'package:ezstock/controllers/controller.dart';
import 'package:ezstock/widgets/ImageCarrousel.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewProductForm extends StatefulWidget {
  @override
  _NewProductFormState createState() => _NewProductFormState();
}

class _NewProductFormState extends State<NewProductForm> {
  bool isNew = false;
  int quantity = 0;
  String category = "Calça";
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final priceController = TextEditingController();
  final sizeController = TextEditingController();

  final Controller controller = Controller();

  List<File> image = [];
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  List<String> imageStrings() {
    List<String> list = [];
    image.forEach((element) => list.add(element.path));
    return list;
  }

  void postStock(BuildContext context) async {
    await sellDialog(context);

    Map<String, dynamic> payload = {
      "quantidade": quantity,
      "nome": nameController.text,
      "codigoProduto": codeController.text,
      "categoria": category,
      "preco": double.parse(priceController.text),
      "tamanho": sizeController.text,
      "ehUsado": isNew,
      "imagens": imageStrings()
    };

    try {
      await controller.postStock(payload);
    } catch (e) {
      print(e);
    } finally {
      Navigator.of(context).pushNamed('/');
    }
  }

  void putStock(BuildContext context) async {
    await sellDialog(context);

    Map<String, dynamic> payload = {
      "quantidade": quantity,
      "nome": nameController.text,
      "codigoProduto": codeController.text,
      "categoria": category,
      "preco": double.parse(priceController.text),
      "tamanho": sizeController.text,
      "ehUsado": isNew,
      "imagens": imageStrings()
    };

    try {
      await controller.postStock(payload);
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  var _categories = [
    "Calça",
    "Blusa",
    "Camiseta",
    "Jaqueta",
    "Acessórios",
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Formulário'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async => await postStock(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRect(
                child: ImageCarrousel(imgList: imageStrings()),
                // child: ImageCarrousel(imgList: item.images),
                clipBehavior: Clip.hardEdge,
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: getImage,
                      child: CircleAvatar(
                        radius: screenSize.width * 0.1,
                        backgroundColor: Colors.grey,
                        child: Center(
                          child: Icon(
                            Icons.camera_alt,
                            size: screenSize.width * 0.09,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(9),
                            child: TextField(
                              controller: nameController,
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                hintText: 'Nome',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(9),
                            child: TextField(
                              controller: priceController,
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                hintText: 'Preço',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.all(9),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          hintText: 'Categoria',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        isEmpty: category == "",
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isDense: true,
                            value: category,
                            onChanged: (String newValue) {
                              setState(() {
                                category = newValue;
                              });
                            },
                            items: _categories
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Peça nova'),
                        Checkbox(
                          checkColor: Colors.white,
                          value: isNew,
                          onChanged: (value) {
                            setState(() {
                              isNew = value;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(9),
                child: TextField(
                  controller: sizeController,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Tamanho',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(9),
                child: TextField(
                  controller: codeController,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Código',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
              title: Text('Quantidade'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Column(
                      children: [
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
