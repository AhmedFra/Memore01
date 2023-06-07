import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/user_pref.dart';
import '../widgets/profile_widget.dart';
import '../widgets/search_text_field.dart';
import 'homepage.dart';
import 'patient_profile.dart';


class PatientList extends StatefulWidget {
  const PatientList({Key? key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(child: PatientListBody()),
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
      height: 200,
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
                'Patient List',
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
              SizedBox(width: 35,),
              
              
            ],
          ),
          SizedBox(height: 20,),
          SearchTextField(),
        ],
      ),
    );
  }
}

class PatientListBody extends StatelessWidget {
  const PatientListBody({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
         Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                      const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
)

                       ],
                       ),
             ),
           ),
         ),




      Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                     const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
)

                       ],
                       ),
             ),
           ),
         ),




         Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                     const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
)

                       ],
                       ),
             ),
           ),
         ),


Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                     const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
)

                       ],
                       ),
             ),
           ),
         ),




Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                     const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
)

                       ],
                       ),
             ),
           ),
         ),




Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                     const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
)

                       ],
                       ),
             ),
           ),
         ),



Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                     const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
)

                       ],
                       ),
             ),
           ),
         ),




Padding( 
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5), 
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
                     const SizedBox(height: 4),
          Text('randompatient@gmail.com',
            style: TextStyle(color: Colors.grey),
          )
                    ],
                  ),
                  SizedBox(width: 80,),
                IconButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientProfile()),
    );
  },
  icon: Icon(Icons.arrow_forward_ios, size: 28, color: Colors.black),
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