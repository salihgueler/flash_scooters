import 'package:flash_scooters/data/scooter_fetcher.dart';
import 'package:flash_scooters/widgets/flash_scooter_map_widget.dart';
import 'package:flash_scooters/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() => runApp(FlashScootersApp());

class FlashScootersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Scooters',
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: Scaffold(
        body: FutureBuilder(
          future: fetchScooters(http.Client()),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return FlashScootersMapWidget(
                scooters: snapshot.data,
              );
            } else {
              return LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
