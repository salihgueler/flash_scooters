import 'package:flash_scooters/model/scooter.dart';
import 'package:flutter/material.dart';

class CurrentMarkerScooter extends ChangeNotifier {
  Scooter _selectedScooter;

  void updateSelectedScooter(Scooter scooter) {
    this._selectedScooter = scooter;
    notifyListeners();
  }

  bool equalsTo(Scooter scooter) => _selectedScooter == scooter;

  String get name => _selectedScooter == null ? '' : _selectedScooter.name;

  String get description =>
      _selectedScooter == null ? '' : _selectedScooter.description;

  String get currency =>
      _selectedScooter == null ? '' : _selectedScooter.currency;

  int get price => _selectedScooter == null ? -1 : _selectedScooter.price;

  int get batteryLevel =>
      _selectedScooter == null ? -1 : _selectedScooter.batteryLevel;

  int get priceTime => _selectedScooter == null ? -1 : _selectedScooter.priceTime;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Scooter &&
          runtimeType == other.runtimeType &&
          _selectedScooter.id == other.id;

  @override
  int get hashCode => _selectedScooter.hashCode;

}
