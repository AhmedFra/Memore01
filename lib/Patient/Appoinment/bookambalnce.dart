import 'package:flutter/material.dart';
import 'bookamnlnce2.dart';

class BookAmbulace extends StatefulWidget {
  
  const BookAmbulace({Key? key}) : super(key: key);

  @override
  State<BookAmbulace> createState() => _BookAmbulanceState();
}

class _BookAmbulanceState extends State<BookAmbulace> {
  
  String selectedCity = '';
  List<String> cities = ['City 1', 'City 2', 'City 3'];

  FormData formData = FormData(yourArea: '', detailAddress: '');
  DestinationPoint destinationPoint = DestinationPoint(yourArea1: '', detailAddress1: '');

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  void _continueButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Mapambulance(
            formData: formData,
            destinationPoint: destinationPoint,
          ),
        ),
      );
    }else if (_formKey1.currentState!.validate()) {
      _formKey1.currentState!.save();
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Mapambulance(
            formData: formData,
            destinationPoint: destinationPoint,
          )));
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 216, 218, 219).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/am3.png'),
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        "Ambulance",
                        style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,),
                    child: Text(
                      "Pickup Point",
                      style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Your Area',
                          labelStyle: TextStyle(fontSize: 25, color: Colors.black),
                          hintText: 'City',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 0.8),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your area';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          formData.yourArea = value!;
                        },
                      ),
                      SizedBox(height: 40,),
                      Container(
                        height: 80,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Detail Address',
                            labelStyle: TextStyle(fontSize: 25, color: Colors.black),
                            hintText: 'Address',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.8),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter detail address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            formData.detailAddress = value!;
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,),
                    child: Text(
                      "Destination Point",
                      style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Your Area',
                          labelStyle: TextStyle(fontSize: 25, color: Colors.black),
                          hintText: 'City',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 0.8),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your area';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          destinationPoint.yourArea1 = value!;
                        },
                      ),
                      SizedBox(height: 40,),
                      Container(
                        height: 80,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Detail Address',
                            labelStyle: TextStyle(fontSize: 25, color: Colors.black),
                            hintText: 'Address',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 0.8),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter detail address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            destinationPoint.detailAddress1 = value!;
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: _continueButtonPressed,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormData {
  String yourArea;
  String detailAddress;

  FormData({required this.yourArea, required this.detailAddress});
}

class DestinationPoint {
  String yourArea1;
  String detailAddress1;

  DestinationPoint({required this.yourArea1, required this.detailAddress1});
}