import 'package:flutter/material.dart';

import 'featured_screen.dart';
import 'patient_list.dart';
import 'profile_screen.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    PatientList(),
    FeaturedScreen(),
    ProfileScreen(),
  ];
  
  @override
   


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)
           ), 
        bottomNavigationBar: BottomNavigationBar(
          
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Color(0xFF398AE5),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.house, size: 27.0,  ),
              icon: Icon(Icons.house_outlined, size: 27.0,),
              label: 'home',
              ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.people, size: 27.0,),
              icon: Icon(Icons.people_outlined, size: 27.0, ),
              label: 'Patients' ,             
              ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings, size: 27.0,),
              icon: Icon(Icons.settings_outlined, size: 27.0,),
              label: 'Settings' ,
              
              ),           
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, size: 27.0,),
              icon: Icon(Icons.person_outline, size: 27.0,),
              label: 'Profile' ,
              
              ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),   
      ),

      );
  }
}