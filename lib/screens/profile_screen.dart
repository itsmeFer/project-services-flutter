import 'package:flutter/material.dart';
import 'package:app_car/custom_colors.dart';
import '../bottom_nav_bar.dart'; // Import the bottom navigation bar

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: CustomColors.primaryGreen,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PROFIL SAYA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Khoirulsyarif',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                const Positioned(
                  top: 230,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 68,
                      backgroundImage: NetworkImage(
                          'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/80/2024/06/12/Towel-3761954803.jpg'), // Replace with your image URL
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(
                      color: CustomColors.textProfile,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Male',
                    style:
                        TextStyle(color: CustomColors.textGrey, fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: CustomColors.textGrey,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, left: 25, top: 10),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Birthday',
                    style: TextStyle(
                      color: CustomColors.textProfile,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '12-12-2002',
                    style:
                        TextStyle(color: CustomColors.textGrey, fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: CustomColors.textGrey,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, left: 25, top: 35),
              child: Row(
                children: [
                  Icon(Icons.email_outlined),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: CustomColors.textProfile,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'khourul@gmail.com',
                    style:
                        TextStyle(color: CustomColors.textGrey, fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: CustomColors.textGrey,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, left: 25, top: 35),
              child: Row(
                children: [
                  Icon(Icons.email_outlined),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: CustomColors.textProfile,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '08217829090',
                    style:
                        TextStyle(color: CustomColors.textGrey, fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: CustomColors.textGrey,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25, left: 25, top: 35),
              child: Row(
                children: [
                  Icon(Icons.lock_outline),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Change Password',
                    style: TextStyle(
                      color: CustomColors.textProfile,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '************',
                    style:
                        TextStyle(color: CustomColors.textGrey, fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: CustomColors.textGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
