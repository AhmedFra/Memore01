

import 'package:flutter/material.dart';
import 'package:memoire/Patient/Appoinment/bookambalnce.dart';
import 'package:flutter/material.dart' as FlutterMaterial;
import 'package:memoire/Patient/Specialist.dart';



class Mapambulance extends StatefulWidget {
  final FormData formData;
  final DestinationPoint destinationPoint;
  
  Mapambulance({required this.formData, required this.destinationPoint});

  @override
  State<Mapambulance> createState() => _MapambulanceState();
}

class _MapambulanceState extends State<Mapambulance> {
  bool saveButtonSelected = false;
  bool cancelButtonSelected = false;

  void _onSaveButtonPressed() {
    // Add logic here to save data and navigate to the previous page (screen1)
    // For now, let's print a message and navigate back to screen1
    print('Ambulance has been booked');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => App()),
    );
  }

  void _onCancelButtonPressed() {
    // Add logic here to cancel and navigate to the preview page
    // For now, let's print a message and navigate back to the preview page
    print('Cancel button pressed');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: FlutterMaterial.AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 15,),
            Text(
              "Book Ambulance",
              style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,),
                    child: Text(
                      "Map direction",
                      style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                
                },
                child: Container(
                  width: 400,
                  height: 300,
                  child: Image.asset(
                    'assets/map03.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup Point",
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text('My Area: ${widget.formData.yourArea}', style: TextStyle(fontSize: 17)),
                    Text('Detail Address: ${widget.formData.detailAddress}', style: TextStyle(fontSize: 17)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Destination Point",
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text('My Area: ${widget.destinationPoint.yourArea1}', style: TextStyle(fontSize: 17)),
                    Text('Detail Address: ${widget.destinationPoint.detailAddress1}', style: TextStyle(fontSize: 17)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: cancelButtonSelected ? Colors.grey : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            cancelButtonSelected = true;
                            saveButtonSelected = false;
                          });
                          _onCancelButtonPressed();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel,
                              color: cancelButtonSelected ? Colors.white : Colors.grey,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                color: cancelButtonSelected ? Colors.white : Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: saveButtonSelected ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            saveButtonSelected = true;
                            cancelButtonSelected = false;
                          });
                          _onSaveButtonPressed();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              color: saveButtonSelected ? Colors.white : Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Save',
                              style: TextStyle(
                                color: saveButtonSelected ? Colors.white : Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}