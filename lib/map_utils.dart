import 'package:google_maps_flutter/google_maps_flutter.dart';


///
/// Method to return a [LatLngBounds] object for limiting the camera are. There is no SDK support for it
/// at the moment. The solution below is retrieved from the comment at the GitHub issue.
/// https://github.com/flutter/flutter/issues/36653#issuecomment-525288053
///
LatLngBounds boundsFromLatLngList(List<LatLng> list) {
  assert(list.isNotEmpty);
  double x0, x1, y0, y1;
  for (LatLng latLng in list) {
    if (x0 == null) {
      x0 = x1 = latLng.latitude;
      y0 = y1 = latLng.longitude;
    } else {
      if (latLng.latitude > x1) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1) y1 = latLng.longitude;
      if (latLng.longitude < y0) y0 = latLng.longitude;
    }
  }
  return LatLngBounds(northeast: LatLng(x1, y1), southwest: LatLng(x0, y0));
}

///
/// Method to do the camera movement for the [GoogleMap]
///
/// Right now there is a problem with the movement of the camera. It needs to be passed with a delay.
/// More information can be found at: https://github.com/flutter/flutter/issues/27936
///
void moveCameraToLatLngBound(
    GoogleMapController controller,
    List<LatLng> latLngList,
    ) {
  const double ZOOM_LEVEL = 16;
  Future.delayed(Duration(milliseconds: 100), () {
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        boundsFromLatLngList(latLngList),
        ZOOM_LEVEL,
      ),
    );
  });
}

BitmapDescriptor getIconForSelectedMarker(
    bool isMarkerSelected
) {
  if (isMarkerSelected) {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
  } else {
    return BitmapDescriptor.defaultMarker;
  }
}
