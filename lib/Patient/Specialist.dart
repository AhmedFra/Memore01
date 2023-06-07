import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Appoinment/Appoinmentpages.dart';
import 'Appoinment/bookambalnce.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
             CustomAppBar(),
            Expanded(child: Body()),
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
            
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous page
                  },
                ),

              
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                'Find a Specialist',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 24.0,
                ),
              ),
                ],
              ),
          const SizedBox(height: 12),
        ],
      ),
        ])
    );
  }
}


class SpecialistItem {
  final String text;
  final String imagePath;

  SpecialistItem({required this.text, required this.imagePath});
}

class Body extends StatelessWidget {
  final List<SpecialistItem> specialistItems = [
    SpecialistItem(text: "Dentist", imagePath: "assets/tooth.png"),
    SpecialistItem(text: "Cardiologist", imagePath: "assets/002.png"),
    SpecialistItem(text: "Allergology", imagePath: "assets/allarg2.png"),
    SpecialistItem(text: "Dermatologist", imagePath: "assets/sk2.png"),
    SpecialistItem(text: "Covid-19Consul", imagePath: "assets/corona.png"),
    SpecialistItem(text: "Ophthalmologist", imagePath: "assets/dar.png"),
    SpecialistItem(text: "Pediatrician", imagePath: "assets/b.png"),
    SpecialistItem(text: "Nursing", imagePath: "assets/nu.png"),
    SpecialistItem(text: "Book Ambulace", imagePath: "assets/bilance.png"),
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   child: const Text(
            //     "Find Specialist",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 30,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(2),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: specialistItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    SpecialistItem item = specialistItems[index];

                    if (index == 8) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookAmbulace(
                                
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                              ),
                              width: double.infinity, // Set the width to fill the entire grid cell
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    item.imagePath,
                                    height: 80, // Increase the height
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    item.text,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentPage(
                               
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    item.imagePath,
                                    height: 60,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    item.text,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ))));
                          
                       
                  }
                  },
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          primary: Color(0xFF73AEF5),
          padding: const EdgeInsets.all(0),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

