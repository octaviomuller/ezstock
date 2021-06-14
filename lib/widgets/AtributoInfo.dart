import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AtributoInfo extends StatelessWidget {
  final atributo;
  final descricao;

  const AtributoInfo(this.atributo, this.descricao);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            this.atributo,
            style: TextStyle(
                fontSize: screenSize.height * 0.022,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            this.descricao,
            style: TextStyle(
                fontSize: screenSize.height * 0.022, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
