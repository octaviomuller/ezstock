import 'package:flutter/material.dart';

class NewProductForm extends StatefulWidget {
  @override
  _NewProductFormState createState() => _NewProductFormState();
}

class _NewProductFormState extends State<NewProductForm> {
  bool isChecked = false;
  TextEditingController _controller;
  var _categories = [
    "Calça",
    "Blusa",
    "Camiseta",
    "Jaqueta",
    "Acessórios",
  ];
  String selected = "Calça";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 30),
              width: screenSize.width,
              height: screenSize.height * 0.3,
              color: Colors.grey,
              child: Center(
                child: Icon(Icons.image, size: 100,),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
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
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(9),
                        child: TextField(
                          controller: _controller,
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
                      Container(
                        padding: EdgeInsets.all(9),
                        child: TextField(
                          controller: _controller,
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
                    ],
                  ),
                ),
              ],
            ),
            Row(
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
                      isEmpty: selected == "",
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isDense: true,
                          value: selected,
                          onChanged: (String newValue) {
                            setState(() {
                              selected = newValue;
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
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(9),
              child: TextField(
                controller: _controller,
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
          ],
        ),
      ),
    );
  }
}
