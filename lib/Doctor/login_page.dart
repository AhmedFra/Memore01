import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/constants.dart';
import 'homepage.dart';
import 'signup_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = false;
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
                            return null;
                            },
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
                           return null;
                          },
                          
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),               
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

 Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
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
        
        {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      Navigator.push(context, new MaterialPageRoute(builder: (context) => MainHomePage()));
    }
  };
        },
        
        child: Text(
          'LOGIN',
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

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
         Navigator.push(context, new MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Dont have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
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
                // ignore: sized_box_for_whitespace
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
                        // Image(image: AssetImage('assets/Favicon-1920w.webp'),
                        //  height: 100,
                        //  width: 100,) ,
                        // ignore: prefer_const_constructors
                        Text('Sign In',
                        // ignore: prefer_const_constructors
                        style: TextStyle(color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(height: 30.0,),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                          _buildEmailTF(),
                        SizedBox(height: 30.0),
                        _buildPasswordTF(),
                        ],),),
                        // ignore: prefer_const_constructors
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        _buildSignupBtn(),
                
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