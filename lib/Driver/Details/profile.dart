import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import '../../Patient/Specialist.dart';
import '../../models/user.dart';
import '../../utilities/user_pref.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/profile_widget.dart';
import '../../models/user.dart';
import '../../utilities/user_pref.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/profile_widget.dart';
import 'edit.dart';


class ProfileScreen01 extends StatefulWidget {
  const ProfileScreen01({Key? key});

  @override
  State<ProfileScreen01> createState() => _ProfileScreen01State();
}

class _ProfileScreen01State extends State<ProfileScreen01> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(child: ProfileScreen01Body()),
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
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
              ),
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

class ProfileScreen01Body extends StatefulWidget {
  const ProfileScreen01Body({Key? key});

  @override
  State<ProfileScreen01Body> createState() => _ProfileScreen01BodyState();
}

class _ProfileScreen01BodyState extends State<ProfileScreen01Body> {
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
        Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildEditButton(context),
            
          ],
        )),

        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Driver",
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Divider(height: 10, color: Colors.black54, endIndent: 20, indent: 20,),
        const SizedBox(height: 10),
        buildGender(user),
        const SizedBox(height: 10),
        Divider(height: 10, color: Colors.black54, endIndent: 20, indent: 20,),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Nouvelle ville Ali mendjli constantine, Constantine",
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Divider(height: 10, color: Colors.black54, endIndent: 20, indent: 20,),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "+213656672495",
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
        Divider(height: 10, color: Colors.black54, endIndent: 20, indent: 20,),
        const SizedBox(height: 10),
         Padding(
           padding: EdgeInsets.symmetric(horizontal: 35),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Birthdate',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "31/05/1990",
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
                 ),
         ),
        Divider(height: 10, color: Colors.black54, endIndent: 20, indent: 20,),
        const SizedBox(height: 10),
      
      ],
    );
  }

  Widget buildEditButton(BuildContext context) => ButtonWidget(
        text: 'Edit info',
        onClicked: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage3()));
        },
      );



  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              user.title,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget buildSpecialty(User user) => Container();

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

  Widget buildYearsExp(User user) => Container();

  Widget buildInstitution(User user) => Container();
}


