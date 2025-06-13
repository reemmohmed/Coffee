import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DeliverytrackingView extends StatelessWidget {
  final LatLng deliveryLocation = const LatLng(31.205753, 29.924526);
  final LatLng courierLocation = const LatLng(31.200000, 29.920000);

  const DeliverytrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildVehicleInfoCards(),
            _buildDeliveryTimer(),
            _buildDeliveryAddress(),
            _buildCourierInfo(),
            _buildMapSection(),
            _buildAvenueLabels(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('High-Fidelity (Delivery)'),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '9:41',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '4.5L',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleInfoCards() {
    return Column(
      children: [
        _buildInfoCard('YPN-S1', '90th S1'),
        _buildInfoCard('BAM-51', 'test'),
        _buildInfoCard('Mermaid Girls', 'HPS'),
      ],
    );
  }

  Widget _buildInfoCard(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryTimer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.timer, color: Colors.blue.shade700),
            const SizedBox(width: 8),
            Text(
              '10 minutes left',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery to 01.Kpg Satoyo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Text(
              'Delivered your order\nWe will deliver your goods to you in the shorter possible time.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourierInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/44.jpg',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Brooklyn Simmons',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Personal Courier',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.blue.shade700),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.phone, color: Colors.blue.shade700),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FlutterMap(
          options: MapOptions(
            onTap: (tapPosition, latLng) {},
            initialZoom: 13.0,
            interactionOptions: InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
              tileDisplay: const TileDisplay.fadeIn(),
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: deliveryLocation,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red.shade700,
                    size: 32,
                  ),
                ),
                Marker(
                  point: courierLocation,
                  child: Icon(
                    Icons.delivery_dining,
                    color: Colors.blue.shade700,
                    size: 32,
                  ),
                ),
              ],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: [courierLocation, deliveryLocation],
                  color: Colors.blue.shade700,
                  strokeWidth: 4.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvenueLabels() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text('2nd Ave', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('3rd Ave', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
