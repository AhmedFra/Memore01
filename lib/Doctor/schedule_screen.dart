import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../models/user.dart';
import '../utilities/user_pref.dart';
import '../widgets/button_widget.dart';

import '../widgets/circle_button.dart';
import '../widgets/profile_widget.dart';
import 'homepage.dart';
import 'appointment1_screen.dart';
import 'appt2_screen.dart';
import 'appt3_screen.dart';
import 'appt4_screen.dart';


class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(child: ScheduleScreenBody()),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 110,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF478FE0),
            Color(0xFF398AE5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainHomePage() ));}
                  , icon: Icon(Icons.arrow_back, color: Colors.white,))
             ,
              Text(
                'Appointments',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 24.0,
                ),
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class ScheduleScreenBody extends StatelessWidget {
  const ScheduleScreenBody({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        CalendarTimeline(
  initialDate: DateTime(2023, 6, 7),
  firstDate: DateTime(2023, 1, 1),
  lastDate: DateTime(2024, 12, 31),
  onDateSelected: (date) => print(date),
  leftMargin: 20,
  monthColor: Colors.blueGrey,
  dayColor: Color(0xFF73AEF5),
  activeDayColor: Colors.white,
  activeBackgroundDayColor: Color(0xFF398AE5),
  dotsColor: Color(0xFF398AE5),
  // selectableDayPredicate: (date) => date.day != 23,
  locale: 'en_ISO',
),
SizedBox(height: 20,),
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
                    padding: const EdgeInsets.all(20),
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
                      Text('Zone Industrielle le Palma, Constantine', style: TextStyle(color: Colors.black,  fontSize: 15),),
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
                    padding: const EdgeInsets.all(20),
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
                    padding: const EdgeInsets.all(20),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('10:00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
                      Text('4bd Ammar Boughaba, 25000, Constantine', style: TextStyle(color: Colors.black,  fontSize: 15),),
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
    SizedBox(width: 136,),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdApptScreen()));
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
                    padding: const EdgeInsets.all(20),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('11:00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
                      Text('Cité Boussouf n°302, 25000, Constantine', style: TextStyle(color: Colors.black,  fontSize: 15),),
                      Row(
  children: [
    Text(
      'Cancelled',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.red
      ),
    ),
    SizedBox(width: 140,),
    ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => FourthApptScreen()));
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
      ],
    );
  }
}