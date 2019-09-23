import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class FlashScootersMapWidget extends StatefulWidget {
  @override
  State<FlashScootersMapWidget> createState() => FlashScootersMapWidgetState();
}

class FlashScootersMapWidgetState extends State<FlashScootersMapWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _circOfficePosition = CameraPosition(
    target: LatLng(52.507978, 13.3892189),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _circOfficePosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}