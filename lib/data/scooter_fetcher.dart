import 'dart:convert';

import 'package:flash_scooters/model/scooter.dart';
import 'package:http/http.dart' as http;

const String SCOOTER_SOURCE_URL = 'https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles';

///
/// Fetches the Scooters from the [SCOOTER_SOURCE_URL] provided.
/// It requires a [http.Client] to make the call
///
/// For the 404, 500 and other errors it will throw a generic exception
///
Future<List<Scooter>> fetchScooters(http.Client client) async {
  final http.Response response = await client.get(SCOOTER_SOURCE_URL);
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
