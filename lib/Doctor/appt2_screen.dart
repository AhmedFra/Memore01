import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';
import '../utilities/user_pref.dart';
import '../widgets/button_widget.dart';

import '../widgets/circle_button.dart';
import '../widgets/profile_widget.dart';
import 'homepage.dart';
import 'schedule_screen.dart';

class SecondApptScreen extends StatefulWidget {
  const SecondApptScreen({Key? key});

  @override
  State<SecondApptScreen> createState() => _SecondApptScreenState();
}

class _SecondApptScreenState extends State<SecondApptScreen> {
   
   
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(child: SecondApptScreenBody()),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleScreen() ));}
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
              // CircleButton(
              //   icon: Icons.notifications,
              //   onPressed: () {},
              // ),
              SizedBox(width: 40,)
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class SecondApptScreenBody extends StatefulWidget {
  const SecondApptScreenBody({Key? key});

  @override
  State<SecondApptScreenBody> createState() => _SecondApptScreenBodyState();
}

class _SecondApptScreenBodyState extends State<SecondApptScreenBody> {
 bool isConfirmed = false;
 String appointmentStatus = 'Scheduled';
 Color getStatusColor(String status) {
    switch (status) {
      case 'Scheduled':
        return Colors.blue;
      case 'Confirmed':
      case 'Finished':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
       Padding(
         padding: const EdgeInsets.only(left: 15.0, right: 15,bottom:15 ),
         child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('09:00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),       
            Text('DD/MM/YYYY', style: TextStyle( fontSize: 20, letterSpacing: 1),),
            SizedBox(width: 80,),
             Text(appointmentStatus,
      style: TextStyle(
        
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: getStatusColor(appointmentStatus),
      ),
    ),
          ],
         ),
       ),
       Padding(
         padding: const EdgeInsets.only(left: 12.0),
         child: Text('Patient profile', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       CircleAvatar(backgroundImage: AssetImage('assets/avatar.png'),maxRadius: 30,)
                        // SizedBox(height: 5,),
                        // Text('07/06/2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                      ],
                      ),
                  ),
                    
                  
                  SizedBox(width: 10,),
                  Column( crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Patient Name', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                     
                    ],
                  ),
                  SizedBox(width: 110,),
                  IconButton(onPressed: () async {
              final Uri number = Uri.parse('tel: +213512456874');
               await launchUrl(number);
             },
                   icon: Icon(Icons.call, size: 28,color: Colors.green,))
                  
                       ],
                       ),
             ),
           ),
         ),
         Padding(
         padding: const EdgeInsets.only(left: 12.0),
         child: Text('Location', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
       ),
       Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10), 
          child: Container(
            height: 90,        
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 235, 238), 
            borderRadius: BorderRadius.circular(12),         
            ),
             child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.gps_fixed, color: Color(0xFF398AE5), size: 25,),
                      Text('Your location', style: TextStyle(color: Color(0xFF398AE5),fontSize: 16),),                
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: Colors.green, size: 25,),
                      Text('14 rue Emir Abdelkader, 25100, El Khroub', style: TextStyle(color: Colors.green ,fontSize: 16),),                
                    ],
                  ),
                ),
              ],
             ),
           ),
         ),


         
      Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10), 
          child: Container(
            height: 190,        
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 235, 238), 
            borderRadius: BorderRadius.circular(12),         
            ),
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 10),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Distance (Km)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text('--')
                    ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 10),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Duration (Min)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text('--')
                    ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 10),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Arrival (Date & Time)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text('DD/MM/YYYY 09:00')
                    ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 10),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Visit Duration (Min)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      Text('60')
                    ],
                   ),
                 ),
                ],
               ),
             ),
           ),
         ),
        Padding(
         padding: const EdgeInsets.only(left: 12.0),
         child: Text('Patient Details', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
       ),
         Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10), 
          child: Container(
            height: 200,        
            decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 235, 238), 
            borderRadius: BorderRadius.circular(12),         
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name',style: TextStyle(fontSize: 16),),
                      SizedBox(height: 10,),
                      Text('Patient',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ),),
                      SizedBox(height: 10,),
                      Text('Last Name',style: TextStyle(fontSize: 16),),
                      SizedBox(height: 10,),
                      Text('Name',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Date Of Birth',style: TextStyle(fontSize: 16),),
                      SizedBox(height: 10,),
                      Text('16/01/1961',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text('Gender',style: TextStyle(fontSize: 16),),
                        SizedBox(height: 10,),
                      Text('Male',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('Phone Number',style: TextStyle(fontSize: 16),),
                      SizedBox(height: 10,),
                      Text('+213512456874',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('E-mail',style: TextStyle(fontSize: 16),),
                      SizedBox(height: 10,),
                      Text('patient2@gmail.com',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  )
                ],
            
              ),
            ),
            ),      
         ),
         
         Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (appointmentStatus == 'Scheduled') ...[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  appointmentStatus = 'Cancelled';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the desired background color
              ),
              child: Text(
                '       Cancel       ',
                style: TextStyle(letterSpacing: 1.2, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  appointmentStatus = 'Confirmed';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set the desired background color
              ),
              child: Text(
                '       Confirm       ',
                style: TextStyle(letterSpacing: 1.2, fontSize: 18),
              ),
            ),
          ),
        ],
        if (appointmentStatus == 'Confirmed') ...[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  appointmentStatus = 'Finished';
                });
                // Handle finish button press event here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the desired background color
              ),
              child: Text( 
                '                        Finish                       ',
                style: TextStyle(letterSpacing: 1.2, fontSize: 18),
              ),
            ),
          ),
        ],
        if (appointmentStatus == 'Finished') ...[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
              onPressed: () {
                // setState(() {
                //   appointmentStatus = 'Finished';
                // });
                // // Handle finish button press event here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the desired background color
              ),
              child: Text(
                '                   Write Report                   ',
                style: TextStyle(letterSpacing: 1.2, fontSize: 18),
              ),
            ),
          ),
        ],
      ],
    ),
      ]
    );
  }
}