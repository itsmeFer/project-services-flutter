import 'package:flutter/material.dart';
import 'package:app_car/custom_colors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'bottom_nav_bar.dart'; // Import the bottom navigation bar

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: DropdownButton<String>(
  value: 'Marelan Ps II', // Ganti dengan nilai default atau yang sesuai
  items: <String>['Marelan Ps II'].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value, style: TextStyle(color: Colors.black)),
    );
  }).toList(),
  onChanged: (String? newValue) async {
    if (newValue == 'Marelan Ps II') {
      // Dapatkan lokasi pengguna
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      // Ubah koordinat menjadi nama lokasi menggunakan geocoding
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Ambil nama lokasi dari placemark pertama
      String locationName = placemarks[0].name ?? 'Unknown';

      // Tampilkan nama lokasi atau lakukan sesuatu dengan nama lokasi ini
      print('Lokasi pengguna: $locationName');
    }
  },
),

        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildAdContainer(
                  'Rekomendasi Mobil Keluarga?',
                  'Bisa muat 8 orang lohh!\nDapatkan disini!',
                  'images/shutterstock_528115456-696x464.jpg', // Add your image asset here
                ),
                buildAdContainer(
                  'Nikmati perjalanan',
                  'dan bawa semua\nbarang-barang Anda!',
                  'images/maxresdefault.jpg', // Add your image asset here
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mobil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lihat Semua',
                style: TextStyle(color: CustomColors.primaryGreen),
              ),
            ],
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return buildCarItem(context);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget buildAdContainer(String title, String subtitle, String imagePath) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 150,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarItem(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'images/nova.png',
              fit: BoxFit.contain,
              height: 100,
            ),
          ),
          SizedBox(height: 10),
          Text('Toyota Fortuner'),
          SizedBox(height: 5),
          Text(
            '2700cc',
            style: TextStyle(
              color: CustomColors.textGrey,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '3.700k / hari',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: CustomColors.primaryGreen,
              borderRadius: BorderRadius.circular(7),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
