

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Patient/profile/profile.dart';
import '../widgets/circle_button.dart';
import '../widgets/search_text_field.dart';
import 'appointment1_screen.dart';
import 'appt2_screen.dart';
import 'patient_list.dart';
import 'schedule_screen.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
            Expanded(child: Body()),
          ],
        ),
      )
      );
  }
}


class AppBar extends StatefulWidget {
  const AppBar({super.key});

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 110,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        gradient: LinearGradient(colors: [        
           Color(0xFF73AEF5),
           Color(0xFF61A4F1),
           Color(0xFF478FE0),
           Color(0xFF398AE5),],
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
           )      
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text('Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 24.0,              
              ), 
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {  },
              ),             
            ],
          ),
          const SizedBox(height: 20,),
          // const SearchTextField(),

        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var _ConsultsNum = 4;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 10, left: 20, right:20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Text('Appointments for today:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            
              TextButton(onPressed: (){}, child: Text('$_ConsultsNum', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF398AE5),),),),          
           ],
          ),
          ),     
         Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10), 
          child: Container(
            height: 100,        
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 235, 238), 
            borderRadius: BorderRadius.circular(12),         
            ),
             child: Padding(
               padding: const EdgeInsets.all(5.0),
               child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('08:00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        // SizedBox(height: 5,),
                        // Text('07/06/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                      ),
                  ),
                    
                  VerticalDivider(width:1, color: Colors.black,endIndent: 10, indent: 10, ),
                  SizedBox(width: 10,),
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Patient Name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('25 rue Larbi Ben Mhidi, 31000, Oran', style: TextStyle(color: Colors.black,  fontSize: 15),),
                      Row(
  children: [
    Text(
      'Finished',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.green
      ),
    ),
    SizedBox(width: 150,),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FirstApptScreen()));
      },
      child: Text('View'),
    ),
  ],
),


                    ],
                  )
                  
                       ],
                       ),
             ),
           ),
         ),
        
          Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0), 
          child: Container(
            height: 100,        
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 235, 238), 
            borderRadius: BorderRadius.circular(12),         
            ),
             child: Padding(
               padding: const EdgeInsets.all(5.0),
               child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('09:00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        // SizedBox(height: 5,),
                        // Text('07/06/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                      ),
                  ),
                    
                  VerticalDivider(width:1, color: Colors.black,endIndent: 10, indent: 10, ),
                  SizedBox(width: 10,),
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Patient Name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('14 rue Emir Abdelkader, 25100, El Khroub', style: TextStyle(color: Colors.black,  fontSize: 15),),
                      Row(
  children: [
    Text(
      'Scheduled',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.blue
      ),
    ),
    SizedBox(width: 137,),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondApptScreen()));
      },
      child: Text('View'),
    ),
  ],
),


                    ],
                  )
                  
                       ],
                       ),
             ),
           ),
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ScheduleScreen()));
              },
              child: Text(
               'See more',
               style: TextStyle(
               color: Color(0xFF398AE5),
               fontSize: 20, // Increase the font size as desired
               ),
               ),
              ),
              SizedBox(width: 10,)
           ],
         ),
        Row(
          children: [

            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Text('How can we help?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            ),
          ],
        ),         
         
        GridView.count(
  shrinkWrap: true,
  crossAxisCount: 2,
  childAspectRatio: 0.8,
  crossAxisSpacing: 20,
  mainAxisSpacing: 24,
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
  children: [
    GestureDetector(
      onTap: () {
        // Handle navigation for Category 1
         Navigator.push(context,MaterialPageRoute(builder: (context) => ScheduleScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 235, 238),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/task-list.png',),
            SizedBox(height: 10),
            Text('My appointments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        // Handle navigation for Category 2
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 235, 238),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/report.png',),
            SizedBox(height: 10),
            Text('My reports', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        // Handle navigation for Category 3
        Navigator.push(context,MaterialPageRoute(builder: (context) => PatientList()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 235, 238),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/contracter.png',),
            SizedBox(height: 10),
            Text('My patients', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        // Handle navigation for Category 4
         Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 235, 238),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/utilisateur.png', ),
            SizedBox(height: 10),
            Text('My profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ],
        ),
      ),
    ),
  ],
),

        ],
      ),
    );
  }
}