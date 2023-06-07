
import 'package:flutter/material.dart';
import 'package:memoire/Doctor/patient_profile.dart';

class MedicalFolder extends StatefulWidget {
  const MedicalFolder({super.key});

  @override
  State<MedicalFolder> createState() => _MedicalFolderState();
}

class _MedicalFolderState extends State<MedicalFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
           Navigator.push(context,MaterialPageRoute(builder: (context) => PatientProfile()));
        }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: InteractiveViewer(child: Image(image: AssetImage('assets/63cf19dc0c75c01e6c66af16_Medical Record Summary Example (Sample).png')),
           panEnabled: true, // Enable panning
      minScale: 0.5, // Minimum scale value
      maxScale: 5, // Maximum scale value
      ),
    );
  }
}