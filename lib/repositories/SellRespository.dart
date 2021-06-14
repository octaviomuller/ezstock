import 'dart:convert';

import 'package:ezstock/models/Sell.dart';
import 'package:ezstock/service.dart';
import 'package:http/http.dart';

class SellRepository {
  final Service service = Service();

  SellRepository();

  Future<List<Sell>> get() async {
    List<Sell> sells = [];

    Response response = await service.get('venda');
    dynamic object = jsonDecode(response.body);
    object.forEach((element) => sells.add(Sell.fromJson(element)));
    
    return sells;
  }
}