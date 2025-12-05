import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import '../widgets/drawer_navigation.dart'; // Import the drawer

class Dealer {
  final String name;
  final String address;
  final LatLng location;
  final String image;

  Dealer({required this.name, required this.address, required this.location, required this.image});
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Dealer> dealers = [
      Dealer(name: 'Ducati Owners Club Indonesia', address: 'Jakarta', location: LatLng(-6.2579339, 106.8083542), image: 'assets/Ducati_owners_club_indonesia.jpg'),
      Dealer(name: 'Seimos Moto', address: 'Bandung', location: LatLng(-6.9442687, 107.6082381), image: 'assets/seimos_moto.jpeg'),
      Dealer(name: 'Ducati Malang', address: 'Malang', location: LatLng(-7.9707906, 112.6007646), image: 'assets/Ducati_malang.jpg'),
      Dealer(name: 'RS Moto Yogyakarta', address: 'Yogyakarta', location: LatLng(-7.7834863, 110.4040868), image: 'assets/rs_moto_yogjakarta.jpg'),
    ];

    final List<Marker> markers = dealers.map((dealer) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: dealer.location,
        child: Icon(Icons.location_pin, color: Colors.red, size: 40.0),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ducati Dealers Indonesia'),
      ),
      drawer: const DrawerNavigation(), // Add the drawer here
      body: PopupScope(
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(-7.0, 109.0), // Centered around Java
            initialZoom: 7.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.flutter.ducati_catalog_app',
            ),
            PopupMarkerLayer(
              options: PopupMarkerLayerOptions(
                markers: markers,
                popupDisplayOptions: PopupDisplayOptions(
                  builder: (BuildContext context, Marker marker) {
                    final dealer = dealers.firstWhere((d) => d.location == marker.point);
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                dealer.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(dealer.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            Text(dealer.address),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
