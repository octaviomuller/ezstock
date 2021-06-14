import 'dart:convert';

import 'package:ezstock/models/Sell.dart';
import 'package:ezstock/models/Stock.dart';
import 'package:ezstock/services/service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Controller extends ChangeNotifier{
  final Service service = Service();
  List<Stock> stocks = [];
  List<Sell> sells = [];

  Controller(){
    this.getStock();
    this.getSell();
  }

  void setInitial() async {
    await this.getStock();
    await this.getSell();
  }

  Future<List<Stock>> getStock() async {
    List<Stock> stocksList = [];

    Response response = await service.get('estoque');
    dynamic object = jsonDecode(response.body);
    object.forEach((element) => stocksList.add(Stock.fromJson(element)));
    this.stocks = stocksList;
    notifyListeners();
    return this.stocks;
  }

  Future<List<Sell>> getSell() async {
    List<Sell> sellList = [];

    Response response = await service.get('venda');
    dynamic object = jsonDecode(response.body);
    object.forEach((element) => sellList.add(Sell.fromJson(element)));
    this.sells = sellList;
    notifyListeners();
    return this.sells;
  }

  void postStock(Map<String, dynamic> stock) async {
    dynamic response = await service.post('estoque', body: stock);
    this.stocks.add(Stock.fromJson(response.body));
    this.getStock();
    await this.getStock();
  }

  void postSell(int id, int qtd) async {
    dynamic response = await service.post('venda/${id.toString()}/qtd=${qtd.toString()}');
    print(response.body);
    this.sells.add(Sell.fromJson(response.body));
  }

  void putStock(Map<String, dynamic> stock) async {
    dynamic response = await service.put('estoque/${stock["id"].toString()}', stock);
    print(response.body);
  }

  void putSell(Map<String, dynamic> sell) async {
    dynamic response = await service.put('venda/${sell["id"].toString()}', sell);
    print(response.body);
    await this.getSell();
  }

  Future<void> deleteStock(int id) async {
    dynamic response = await service.delete('estoque/${id.toString()}');
    print(response.body);
    await this.getStock();
  }

  void deleteSell(int id) async {
    dynamic response = await service.delete('venda/${id.toString()}');
    print(response.body);
    await this.getSell();
  }
}
