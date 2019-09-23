import 'dart:async';
import 'dart:convert';

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
      home: FlashScooterMainPage(),
    );
  }
}

class FlashScooterMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlashScootersMapWidget(),
          LoadingWidget()
        ],
      ),
    );
  }
}