import 'dart:convert';

import 'package:flash_scooters/model/scooter.dart';
import 'package:http/http.dart' as http;

Future<List<Scooter>> fetchScooters() async {
  http.Response response = await http.get(
      'https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles');

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => Scooter.fromJson(e))
        .toList();
  } else if (response.statusCode == 404) {
    throw Exception('404 not found!');
  } else if (response.statusCode == 500) {
    throw Exception('500 something wrong with the server!');
  } else {
    throw Exception('Something went wrong');
  }
}
