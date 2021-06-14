import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Service();

  Future<http.Response> get(route) async {
    return await http
        .get(Uri.parse('https://app-ezstock.herokuapp.com/$route'));
  }

  Future<http.Response> post(route, {body}) async {
    if (body != null) {
      return await http.post(
        Uri.parse('https://app-ezstock.herokuapp.com/$route'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );
    } else {
      return await http
          .post(Uri.parse('https://app-ezstock.herokuapp.com/$route'));
    }
  }

  Future<http.Response> put(route, body) async {
    return await http.post(
      Uri.parse('https://app-ezstock.herokuapp.com/$route'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> delete(route) async {
    return await http
        .delete(Uri.parse('https://app-ezstock.herokuapp.com/$route'));
  }
}
