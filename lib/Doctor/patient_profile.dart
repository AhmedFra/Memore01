import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:memoire/Doctor/patient_list.dart';

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
import 'package:url_launcher/url_launcher.dart';

import 'medical_folder.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(child: PatientProfileBody()),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PatientList() ));}
                  , icon: Icon(Icons.arrow_back, color: Colors.white,))
             ,
              Text(
                '',
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
              SizedBox(width: 35,)
            ],
          ),
          const SizedBox(height: 0),
        ],
      ),
    );
  }
}

class PatientProfileBody extends StatelessWidget {
  const PatientProfileBody({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 10),
        ProfileWidget(
          imagePath: user.imagePath,
          onClicked: () async {},
          isEdit: false,
        ),
        const SizedBox(height: 24),
        
        
        Column(
        children: [
        Text('Patient Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),


        const SizedBox(height: 10),


        Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Tooltip(
           message: 'Call',
           child: IconButton(
             onPressed: () async {
              final Uri number = Uri.parse('tel: +213671279413');
               await launchUrl(number);
             },
             icon: Icon(Icons.call, color: Colors.green, size: 30,),
           ),
         ),
         SizedBox(width: 5,),
  Tooltip(
    message: 'E-mail',
    child: IconButton(
      onPressed: () async {
              final Uri email = Uri.parse('mailto: randompatient@gmail.com');
               await launchUrl(email);
             },
      icon: Icon(Icons.message_sharp, color: Color(0xFF398AE5), size: 30,),
    ),
  ),
  SizedBox(width: 5,),
  Tooltip(
    message: 'Medical Folder',
    child: IconButton(
      onPressed: () {
         Navigator.push(context,MaterialPageRoute(builder: (context) => MedicalFolder()));
      },
      icon: Icon(Icons.folder_copy, color: Color.fromARGB(255, 255, 220, 93), size: 30,),
    ),
  ),
         
         ],
        )),   


        const SizedBox(height: 10),


        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),

        const SizedBox(height: 10),

        Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Male',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),

        const SizedBox(height: 10),

        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),

        const SizedBox(height: 10),

        Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('ZI Ibn Badis BP 65A Poste Djeffel, 25100, El Khroub',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),

        const SizedBox(height: 10),

        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),

        const SizedBox(height: 10),

        Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('+213671279413',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),

            
          ],
        ),
      ),

        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),

        const SizedBox(height: 10),

        Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Birthdate',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('31/05/2002',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
               ],
        ),
      ),


       
      ],
      

    );
  }




      

}