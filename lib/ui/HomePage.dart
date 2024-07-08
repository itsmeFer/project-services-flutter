import 'package:app_car/models/car_page_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app_car/custom_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../bottom_nav_bar.dart';

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

  Future<List<CarPageModel>> getCarPages() async {
    try {
      var response = await Dio().get("http://10.0.2.2:8000/api/car");
      debugPrint('Response car page : ${response.data}');

      if (response.statusCode != 200) throw Exception('Failed to fecth data');

      List list = response.data;
      List<CarPageModel> listCarPage =
          list.map((element) => CarPageModel.fromJson(element)).toList();

      return listCarPage;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    getCarPages();
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
              child: Text(value, style: const TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (String? newValue) async {
            if (newValue == 'Marelan Ps II') {
              Position position = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high,
              );

              List<Placemark> placemarks = await placemarkFromCoordinates(
                position.latitude,
                position.longitude,
              );

              String locationName = placemarks[0].name ?? 'Unknown';

              print('Lokasi pengguna: ${locationName}');
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SizedBox(
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
          const SizedBox(height: 25),
          const Row(
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
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return buildData(context);
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
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
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
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildData(BuildContext context) {
    return FutureBuilder(
      future: getCarPages(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        } else if (snapshot.hasData) {
          List<CarPageModel> list = snapshot.data;
          debugPrint(list.toString());
          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index].name.toString()),
                subtitle: Text(list[index].category.toString()),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
            ),
            itemCount: list.length,
          );
        } else {
          return const Center(
            child: Text('Does not data'),
          );
        }
      },
    );
  }

  Widget buildCarItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
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
          const SizedBox(height: 10),
          const Text('Toyota Fortuner'),
          const SizedBox(height: 5),
          const Text(
            '2700cc',
            style: TextStyle(
              color: CustomColors.textGrey,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '3.700k / hari',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: CustomColors.primaryGreen,
              borderRadius: BorderRadius.circular(7),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white, size: 16),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
