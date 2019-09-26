import 'package:flash_scooters/model/current_marker_scooter.dart';
import 'package:flash_scooters/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///
/// A Card Widget that shows some information about the current [Scooter]
///
class InformationWindowWidget extends StatelessWidget {
  final double iconSize = 16;
  final double informationWindowHeight = 200;
  final double informationWindowButtonHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (
      BuildContext context,
      CurrentMarkerScooter currentMarkerScooter,
      Widget child,
    ) {
      final scooterInformationText =
          '${currentMarkerScooter.description} #${currentMarkerScooter.name}';
      final scooterBatteryLevelText = '${currentMarkerScooter.batteryLevel}%';
      final scooterPricingInformationText =
          '${currentMarkerScooter.price / 100} ${currentMarkerScooter.currency} / ${currentMarkerScooter.priceTime} sec.';
      return Container(
        height: informationWindowHeight,
        margin: mainEdgeInsetsAll,
        child: Card(
          child: Padding(
            padding: mainEdgeInsetsAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _createScooterInformationTextWidget(scooterInformationText),
                _createScooterBatteryLevelWidget(
                  scooterBatteryLevelText,
                  currentMarkerScooter.batteryLevel,
                ),
                _createScooterPricingWidget(scooterPricingInformationText),
                _createStartScooterRideButton()
              ],
            ),
          ),
        ),
      );
    });
  }

  IconData _getIconDataForBatteryLevel(int batteryLevel) {
    const MINIMUM_BATTERY_LEVEL = 20;
    if (batteryLevel < MINIMUM_BATTERY_LEVEL) {
      return Icons.battery_alert;
    } else {
      return Icons.battery_std;
    }
  }

  Text _createScooterInformationTextWidget(String scooterInformationText) {
    return Text(
      scooterInformationText,
      style: informationTextStyle,
    );
  }

  Padding _createScooterBatteryLevelWidget(
    String scooterBatteryLevelText,
    int batteryLevel,
  ) {
    return Padding(
      padding: infoWindowEdgeInsetsTopBottom,
      child: Row(
        children: <Widget>[
          Icon(
            _getIconDataForBatteryLevel(
              batteryLevel,
            ),
            size: iconSize,
          ),
          Text(scooterBatteryLevelText)
        ],
      ),
    );
  }

  Padding _createScooterPricingWidget(String scooterPricingInformationText) {
    return Padding(
      padding: infoWindowEdgeInsetsBottom,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.payment,
            size: iconSize,
          ),
          Text(scooterPricingInformationText)
        ],
      ),
    );
  }

  MaterialButton _createStartScooterRideButton() {
    return MaterialButton(
      height: informationWindowButtonHeight,
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: flashScootersBlue,
      highlightColor: flashScootersDarkBlue,
      splashColor: flashScootersDarkBlue,
      child: Text(
        'Start playing',
        style: buttonTextStyle,
      ),
    );
  }
}
