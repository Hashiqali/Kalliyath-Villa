import 'dart:developer';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

void checkLocationPermission(double lat, double lng) async {
  PermissionStatus locationStatus = await Permission.location.request();
  if (locationStatus.isGranted) {
    await getLocation();
    openGoogleMaps(lat, lng);
  } else if (locationStatus.isDenied) {
  } else if (locationStatus.isPermanentlyDenied) {
    openAppSettings();
  }
}
double userlat = 0.0;
double userlong = 0.0;
Future<void> getLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userlat = position.latitude;
    userlong = position.longitude;
  } catch (e) {
    log(e.toString());
  }
}

TileLayer get openmap => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );

Future<void> openGoogleMaps(double lat, double lng) async {
  final googleMapsUrl =
      Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$lng");
  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl);
  } else {
    throw 'Could not launch Google Maps';
  }
}
