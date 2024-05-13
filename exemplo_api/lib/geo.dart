import 'package:geolocator/geolocator.dart';

void getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
}

void trackLocation() {
  var locationStream = Geolocator.getPositionStream(
    desiredAccuracy: LocationAccuracy.high,
    distanceFilter: 10, // em metros
  );
  locationStream.listen((Position position) {
    print('Nova localização - Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  });
}
