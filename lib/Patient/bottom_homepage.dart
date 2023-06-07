import 'package:flutter/material.dart';

import 'Reminder.dart';

import 'home.dart';
import 'profile/profile.dart';

class Patient extends StatefulWidget {
  const Patient({Key? key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  int _selectedIndex = 0;
  static  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    
    Reminders(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF398AE5),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home_outlined, size: 27.0),
              icon: Icon(Icons.home_outlined, size: 27.0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.calendar_month_rounded, size: 27.0),
              icon: Icon(Icons.calendar_month_outlined, size: 27.0),
              label: 'Reminder',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, size: 27.0),
              icon: Icon(Icons.person_outline, size: 27.0),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
