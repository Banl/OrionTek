import 'dart:convert';

import 'package:agendaa/models/client.dart';
import 'package:http/http.dart' as http;

class BoxService {
  Future<List<Clients>?> getClients() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:8080/clients');
    try {
      var response = await client.get(uri);
      switch (response.statusCode) {
        case 200:
          var json = response.body;
          List t = jsonDecode(json);
          List<Clients> c = t.map((e) => Clients.fromJson(e)).toList();
          return (c);
        default:
          return null;
      }
    } catch (e) {
      return null;
    }
  }
}
