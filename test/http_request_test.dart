import 'package:flash_scooters/data/scooter_fetcher.dart';
import 'package:flash_scooters/model/scooter.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

class MockClient extends Mock implements http.Client {}

main() {
  group('fetchScooters', () {
    test('returns the list of scooters', () async {
      final client = MockClient();

      when(client.get(
              'https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles'))
          .thenAnswer((_) async => http.Response('[]', 200));

      expect(await fetchScooters(client), const TypeMatcher<List<Scooter>>());
    });

    test('returned first element name is correct after parse', () async {
      final client = MockClient();

      when(client.get(
              'https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles'))
          .thenAnswer((_) async => http.Response('''
          [{"id": 1, "name":"001100", "description": "Electric Scooter", "latitude": 52.529077, "longitude": 13.416351, "batteryLevel": 98, "timetamp": "2019-03-10T09:31:56Z", "price": 15, "priceTime": 60, "currency": "Euro"}]
          ''', 200));

      List<Scooter> futureList = await fetchScooters(client);

      expect(futureList[0].name, equals('001100'));
    });

    test('returned 404 error', () async {
      final client = MockClient();

      when(client.get(
              'https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles'))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchScooters(client), throwsException);
    });

    test('returned 500 error', () async {
      final client = MockClient();

      when(client.get(
              'https://my-json-server.typicode.com/FlashScooters/Challenge/vehicles'))
          .thenAnswer(
              (_) async => http.Response('Something wrong on the server', 500));

      expect(fetchScooters(client), throwsException);
    });
  });
}