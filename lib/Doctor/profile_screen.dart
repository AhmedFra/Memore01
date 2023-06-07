import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../models/user.dart';
import '../utilities/user_pref.dart';
import '../widgets/button_widget.dart';

import '../widgets/circle_button.dart';
import '../widgets/profile_widget.dart';
import 'edit_profile_screen.dart';
import 'homepage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(child: ProfileScreenBody()),
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
                'Profile',
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

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({Key? key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
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
        buildName(user),
        const SizedBox(height: 10),
        Center(child: buildEditButton(context)),   
        const SizedBox(height: 10),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildAbout(user),
        const SizedBox(height: 10),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildSpecialty(user),
        const SizedBox(height: 10),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildGender(user),
        const SizedBox(height: 10),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildAddress(user),
        const SizedBox(height: 10),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildPhoneNumber(user),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildBirthDate(user),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildYearsExp(user),
        Divider(height: 10,color:Colors.black54 ,endIndent: 20,indent: 20,),
        const SizedBox(height: 10),
        buildInstitution(user),
      ],
    );
  }

Widget buildEditButton(BuildContext context) => ButtonWidget(
  text: 'Edit info',
  
  onClicked: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
  },
);

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.title,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

       Widget buildSpecialty(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Specialty',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.specialty,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

       Widget buildGender(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gender',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.gender,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

       Widget buildAddress(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.address,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

       Widget buildPhoneNumber(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.phoneNumber,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),

            
          ],
        ),
      );

      Widget buildBirthDate(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Birthdate',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.birthdate,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
               ],
        ),
      );

      Widget buildYearsExp(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Years Experience',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.yearsExp,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

      Widget buildInstitution(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Workplace',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.institution,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}