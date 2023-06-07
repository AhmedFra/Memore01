
import 'package:flutter/material.dart';



class Medical_Folder extends StatefulWidget {
  const Medical_Folder({super.key});

  @override
  State<Medical_Folder> createState() => _Medical_FolderState();
}

class _Medical_FolderState extends State<Medical_Folder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          //  Navigator.push(context,MaterialPageRoute(builder: (context) => PatientProfile2()));
        }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),
      body: InteractiveViewer(child: Image(image: AssetImage("assets/Sample.png")),
           panEnabled: true, // Enable panning
      minScale: 0.5, // Minimum scale value
      maxScale: 5, // Maximum scale value
      ),
    );
  }
}