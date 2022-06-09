import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      var g = await Geolocator().checkGeolocationPermissionStatus();
      if (g == GeolocationStatus.denied) {
        return;
      }
      var isLocationServiceEnabled =
          await Geolocator().isLocationServiceEnabled();
      if (isLocationServiceEnabled == false) {
        return;
      }
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }

//    try {
//      Position position = await Geolocator()
//          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//      latitude = position.latitude;
//      longitude = position.longitude;
//    } catch (e) {
//      print(e);
//    }
  }
}
