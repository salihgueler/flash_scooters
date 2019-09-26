import 'dart:async';
import 'package:flash_scooters/map_utils.dart';
import 'package:flash_scooters/model/current_marker_scooter.dart';
import 'package:flash_scooters/model/scooter.dart';
import 'package:flash_scooters/widgets/information_window_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

///
/// A widget that shows the [Scooter] positions on the map.
///
/// In each marker click it animates an animated card view to show the information about the current Scooter.
///
class FlashScootersMapWidget extends StatefulWidget {
  final List<Scooter> scooters;

  FlashScootersMapWidget({@required this.scooters});

  @override
  State<FlashScootersMapWidget> createState() => FlashScootersMapWidgetState();
}

class FlashScootersMapWidgetState extends State<FlashScootersMapWidget>
    with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller = Completer();
  final CurrentMarkerScooter _currentMarkerScooter = CurrentMarkerScooter();
  final CameraPosition _circOfficePosition = CameraPosition(
    target: LatLng(52.507978, 13.3892189),
    zoom: 14.4746,
  );

  Animation<Offset> _offsetAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: _animationController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrentMarkerScooter>(
        builder: (context) => _currentMarkerScooter,
        child: Consumer<CurrentMarkerScooter>(
          builder: (
            BuildContext buildContext,
            CurrentMarkerScooter currentMarkerScooter,
            Widget child,
          ) {
            return Stack(children: <Widget>[
              _createGoogleMap(),
              _createInformationWindow(),
            ]);
          },
        ));
  }

  Positioned _createInformationWindow() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: InformationWindowWidget(),
      ),
    );
  }

  GoogleMap _createGoogleMap() {
    final List<LatLng> latLngList = widget.scooters
        .map((scooter) => LatLng(scooter.latitude, scooter.longitude))
        .toList();

    return GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: _circOfficePosition,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        moveCameraToLatLngBound(controller, latLngList);
        _controller.complete(controller);
      },
      markers: _createMarkersFromScooters(widget.scooters),
    );
  }

  Set<Marker> _createMarkersFromScooters(List<Scooter> scooters) {
    if (scooters.isEmpty) {
      return Set<Marker>();
    } else {
      return scooters.map((scooter) {
        return Marker(
            markerId: MarkerId(scooter.id.toString()),
            icon: getIconForSelectedMarker(
              _currentMarkerScooter.equalsTo(scooter),
            ),
            position: LatLng(
              scooter.latitude,
              scooter.longitude,
            ),
            onTap: () {
              if (_currentMarkerScooter.equalsTo(scooter)) {
                _hideInformationWidget();
              } else {
                _showInformationWidget(scooter);
              }
            });
      }).toSet();
    }
  }

  void _hideInformationWidget() {
    _animationController.reverse();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _currentMarkerScooter.updateSelectedScooter(null);
      }
    });
  }

  void _showInformationWidget(Scooter scooter) {
    _animationController.forward();
    _currentMarkerScooter.updateSelectedScooter(scooter);
  }
}
