import 'package:flash_scooters/model/scooter.dart';
import 'package:flutter/material.dart';

///
/// Keeps the information about the current selected [Scooter] and
/// serves information about it to be shared via Provider.
///
class CurrentMarkerScooter extends ChangeNotifier {
  Scooter _selectedScooter;

  void updateSelectedScooter(Scooter scooter) {
    this._selectedScooter = scooter;
    notifyListeners();
  }

  bool equalsTo(Scooter scooter) => _selectedScooter == scooter;

  String get name => _selectedScooter?.name ?? '';

  String get description => _selectedScooter?.description ?? '';

  String get currency => _selectedScooter?.currency ?? '';

  int get price => _selectedScooter?.price ?? -1;

  int get batteryLevel => _selectedScooter?.batteryLevel ?? -1;

  int get priceTime => _selectedScooter?.priceTime ?? -1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Scooter &&
          runtimeType == other.runtimeType &&
          _selectedScooter.id == other.id;

  @override
  int get hashCode => _selectedScooter.hashCode;
}
