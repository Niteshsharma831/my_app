import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationExp extends StatefulWidget {
  const LocationExp({super.key});

  @override
  State<LocationExp> createState() => _LocationExpState();
}

class _LocationExpState extends State<LocationExp> {
  String mylocation = "";

  @override
  void initState() {
    super.initState();
    getPosition().then((position) {
      setState(() {
        mylocation =
            "Latitute: ${position.latitude}, Longitute: ${position.longitude}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(mylocation),
      ),
    );
  }

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
}
