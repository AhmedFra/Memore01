import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import '../utilities/constants.dart';
import 'login_page.dart';
import 'schedule_signup_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  bool _isSuccessful = false;
  var confirmPass;
  final _formKey = GlobalKey<FormState>();
  Widget _buildEmailTF() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('E-mail',
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
                          validator: (value) {
                           if (value == null || value.isEmpty) {
                           return 'Please enter your e-mail';
                           }
                           return null;},
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                            hintText: 'Enter your E-mail',
                            hintStyle: kHintTextStyle,
                          ),        
                        ),
                        ),
                    ],
                  );
  }

   Widget _buildPasswordTF () {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Password',
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
                           validator: (value) {
                           if (value == null || value.isEmpty) {
                           return 'Please enter your password';
                           }
                           return null;},
                          controller: _controller,
                          keyboardType: TextInputType.text,  
                          obscureText: _obscureText,                      
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            hintText: 'Enter your password',
                            hintStyle: kHintTextStyle,
                            suffixIcon: GestureDetector(
                              onTap: () {
                            setState(() {
                           _obscureText = !_obscureText;
                           });
                           },
                              child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white,

                              )
                              ),
                          ),        
                        ),
                        ),
                    ],
                  );
  }

   Widget _buildConfirmPasswordTF () {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      // ignore: prefer_const_constructors
                      Text('Confirm Password',
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
                           validator: (value) {
                           if (value == null || value.isEmpty) {
                           return 'Please enter your password';
                           }
                           return null;},      
                          keyboardType: TextInputType.text, 
                          obscureText: _obscureText,                      
                          style: TextStyle(color: Colors.white),                         
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(Icons.lock, color: Colors.white),
                            hintText: 'Confirm your password',
                            hintStyle: kHintTextStyle,
                            suffixIcon: GestureDetector(
                              onTap: () {
                            setState(() {
                           _obscureText = !_obscureText;
                           });
                           },
                              child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.white,

                              )
                              ),
                          ),        
                        ),
                        ),
                    ],
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

   Widget _buildSecondSignupPageBtn() {
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
        onPressed: () {
         if (_formKey.currentState!.validate()) {
         Navigator.push(context, new MaterialPageRoute(builder: (context) => SecondSignupPage()));}},
        child: Text(
          'NEXT',
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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                            Text('Sign Up',                   
                            style: TextStyle(color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0,),
                            Text('Account information',                   
                            style: TextStyle(color: Colors.white70,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal),
                            ),
                            SizedBox(height: 30.0,),
                            Form(
                              key: _formKey,
                              child: Column(children: [
                              _buildEmailTF(),
                            SizedBox(height: 10.0,),
                            _buildPasswordTF(),
                            SizedBox(height: 30.0,),
                            FlutterPwValidator(
                              uppercaseCharCount: 2,
                              numericCharCount: 2,
                              width: 400,
                              height: 100,
                              minLength: 8,
                              successColor: Colors.greenAccent,
                              failureColor: Colors.red,
    
                              onSuccess: (){
                                setState(() {
                                  _isSuccessful = true;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password is valid')));
                              },
                              controller: _controller),
                            SizedBox(height: 10.0),
                              
                            
                            _buildConfirmPasswordTF(),
                            SizedBox(height: 20.0,),                    
                            ],)),
                            
                            _buildSecondSignupPageBtn(),
                            
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