import 'dart:convert';

import 'package:ezstock/models/Stock.dart';
import 'package:ezstock/service.dart';
import 'package:http/http.dart';

class StockRepository {
  final Service service = Service();

  StockRepository();

  Future<List<Stock>> get() async {
    List<Stock> stocks = [];

    Response response = await service.get('estoque');
    dynamic object = jsonDecode(response.body);
    object.forEach((element) => stocks.add(Stock.fromJson(element)));
    print('producst: ' + stocks.toString());
    return stocks;
  }

  void post(Map<String, dynamic> stock) async {
    dynamic response = await service.post('estoque', stock);
    print(response.body);
  }
}
