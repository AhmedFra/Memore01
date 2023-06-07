import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../utilities/constants.dart';
import 'login_page.dart';
import 'signup_page.dart';


class SecondSignupPage extends StatefulWidget {
  const SecondSignupPage({super.key});

  @override
  State<SecondSignupPage> createState() => _SecondSignupPageState();
}

class _SecondSignupPageState extends State<SecondSignupPage> {

  final TextEditingController _birthdayController = TextEditingController();
  void _showDatepicker() {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2024)).then((value) {
      setState(() {
        _birthDate = _dateTime.toString();
        _dateTime = value!;
      });
    });
  }

  DateTime _dateTime = DateTime(2002); 
  String _birthDate = 'Select your birthdate';
  Widget _buildUserNameTF() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Username',
                      // ignore: prefer_const_constructors
                      style: kLabelStyle,                   
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            hintText: 'Enter your username',
                            hintStyle: kHintTextStyle,
                          ),        
                        ),
                        ),
                    ],
                  );
  }

  Widget _buildFullNameTF() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Fullname',
                      // ignore: prefer_const_constructors
                      style: kLabelStyle,                   
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            hintText: 'Enter your fullname',
                            hintStyle: kHintTextStyle,
                          ),        
                        ),
                        ),
                    ],
                  );
  }

   Widget _buildPhoneNumberTF() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Phone number',
                      // ignore: prefer_const_constructors
                      style: kLabelStyle,                   
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.phone, color: Colors.white),
                            hintText: 'Enter your phone number',
                            hintStyle: kHintTextStyle,
                          ),        
                        ),
                        ),
                    ],
                  );
  }

  Widget _buildSignupBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
    elevation: 5.0,
    backgroundColor: Colors.white,
     shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
  ),     
        onPressed: () => print('Signup Button Pressed'),       
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),
    );
  }

  Widget _buildloginBtn() {
    return GestureDetector(
      onTap: () {
         Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildBirthdayTF() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Birthdate',
                      // ignore: prefer_const_constructors
                      style: kLabelStyle,                   
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          onTap: () {
                            _showDatepicker();
                          
                          },
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.calendar_month, color: Colors.white),
                            hintText: _birthDate,
                            hintStyle: kHintTextStyle,
                            
                          ),   
                          
                          controller: _birthdayController, 
                        ),
                        ),
                    ],
                  );
  }

  Widget _buildAddressTF() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Address',
                      // ignore: prefer_const_constructors
                      style: kLabelStyle,                   
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.location_on, color: Colors.white),
                            hintText: 'Enter your address',
                            hintStyle: kHintTextStyle,
                          ),        
                        ),
                        ),
                    ],
                  );
  }

Widget _buildGenderTF() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Gender',
                      // ignore: prefer_const_constructors
                      style: kLabelStyle,                   
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10.0,),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        height: 60.0,
                        child: TextFormField(
                          
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.male, color: Colors.white),
                            hintText: 'Enter your gender',
                            hintStyle: kHintTextStyle,
                          ),        
                        ),
                        ),
                    ],
                  );
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
           value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
                  children: [
                    Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                              Color(0xFF73AEF5),
                              Color(0xFF61A4F1),
                              Color(0xFF478FE0),
                              Color(0xFF398AE5),
                              ],
                              stops: [0.1, 0.4, 0.7, 0.9],
                            )
                          ),
                        ),
                     Container(
                          height: double.infinity,
                          // ignore: prefer_const_constructors
                          child: SingleChildScrollView(
                            // ignore: prefer_const_constructors
                            physics: AlwaysScrollableScrollPhysics(),
                            // ignore: prefer_const_constructors
                            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                            // ignore: prefer_const_constructors
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(onPressed: (){
                                       Navigator.push(context, new MaterialPageRoute(builder: (context) => SignUpPage()));
                                    },
                                    icon: Icon(Icons.arrow_back,
                                    color: Colors.white,
                                    size: 32.0),)                                  
                                  ],
                                )
                                ,
                                Text('Sign Up',                   
                                style: TextStyle(color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10.0,),
                                Text('Personal information',                   
                                style: TextStyle(color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 30.0,),
                                _buildUserNameTF(),
                            SizedBox(height: 10.0,),
                            _buildFullNameTF(),
                            SizedBox(height: 10.0,),
                            _buildPhoneNumberTF(),
                            SizedBox(height: 10.0,),
                            _buildBirthdayTF(),
                            SizedBox(height: 10.0,),
                            _buildAddressTF(),
                            SizedBox(height: 10.0,),
                            _buildGenderTF(),
                            SizedBox(height: 10.0,),
                            _buildSignupBtn(),                       
                            _buildloginBtn(),
                            ],
                            ),
                        
                          ),
                        )
              
                  ],
                ),
          ),
        ),
    
      ),
    );
  }
}