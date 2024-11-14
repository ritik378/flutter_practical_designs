import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var currentPosition = const LatLng(28.6139, 77.2090).obs;

  // var isLoading = true.obs;
  late GoogleMapController mapController;
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('Sydney'),
      position: LatLng(-33.86, 151.20),
    ),
    const Marker(
      markerId: MarkerId('Delhi'),
      position: LatLng(28.6139, 77.2090),
    ),
    const Marker(
      markerId: MarkerId('Mumbai'),
      position: LatLng(19.0760, 72.8777),
    ),
    const Marker(
      markerId: MarkerId('Bangalore'),
      position: LatLng(12.9716, 77.5946),
    ),
    const Marker(
      markerId: MarkerId('Chennai'),
      position: LatLng(13.0827, 80.2707),
    ),
    const Marker(
      markerId: MarkerId('Kolkata'),
      position: LatLng(22.5726, 88.3639),
    ),
    const Marker(
      markerId: MarkerId('Hyderabad'),
      position: LatLng(17.3850, 78.4867),
    ),
  };

  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Handle permission denial
        // isLoading.value = false;
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double lat = position.latitude;
      double long = position.longitude;
      LatLng location = LatLng(lat, long);
      currentPosition.value = location;
      // Add a marker for current location (replace any existing one)
      markers.add(Marker(
        markerId: const MarkerId('current_location'),
        position: currentPosition.value,
        infoWindow: const InfoWindow(title: 'Current Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure), // Custom marker
      ));
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: currentPosition.value, zoom: 12)),
      );
      mapController.moveCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: currentPosition.value, zoom: 12)),
      );
      update();
    } catch (e) {
      // Handle error
      print('Error getting location: $e');
    } finally {
      // isLoading.value = false;
    }
  }
}
