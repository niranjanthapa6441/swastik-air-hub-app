import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/billing_info_page/billing_info_page.dart';
import 'package:swastik_air_hub/pages/booking_details_page/main_bookings_page.dart';
import 'package:swastik_air_hub/pages/homepage/main_home_page.dart';
import 'package:swastik_air_hub/pages/profilepage/main_profile_page.dart';

import '../search_flight_page/main_search_flight_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  List pages = [
    Homepage(),
    SeacrhFlightPage(),
    Bookings(),
    BillingInfoPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
              size: 30,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.payment,
              size: 30,
            ),
            label: 'Billings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: const TextStyle(
            fontSize: 15, color: Color.fromARGB(218, 39, 41, 39)),
        unselectedItemColor: const Color.fromARGB(218, 39, 41, 39),
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(
          fontSize: 16,
        ),
        selectedItemColor: const Color.fromARGB(169, 46, 38, 196),
        onTap: _onItemTapped,
      ),
    );
  }
}
