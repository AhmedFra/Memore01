import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import

import 'login_page.dart';

class OnboardingScreenHomecare extends StatefulWidget {
  const OnboardingScreenHomecare({super.key});

  @override
  State<OnboardingScreenHomecare> createState() => _OnboardingScreenHomecareState();
}

class _OnboardingScreenHomecareState extends State<OnboardingScreenHomecare> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i=0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    height: 8.0,
    width: isActive ? 24.0: 16.0,
    decoration: BoxDecoration(color: isActive ? Colors.white : const Color(0xFF73AEF5),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478FE0),
                  Color(0xFF398AE5),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));  
                    },
                     child: const Text('Skip', style: TextStyle(color: Colors.white, fontSize: 22.0,),),
                     
                     ),
                  ),
                  SizedBox(
                    height: 500.0,
                    child: PageView(
                      physics:  ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children:  <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(image: AssetImage('assets/blood.webp'),
                                  height: 300.0,
                                  width: 300.0,),
                                ),
                                
                                Center(
                                  child: Text(
                                    'Welcome to our Homecare App!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.7
                                    ),),
                                ),
                                SizedBox(height: 15.0,),
                                Center(
                                  child: Text('Designed for you to manage your homecare needs and keep track of your personal or loved ones care.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                      )
                                  ),
                                ),
                        
                            ],
                          ),
                        ),
    
    
                         Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(image: AssetImage('assets/blood.webp'),
                                  height: 300.0,
                                  width: 300.0,),
                                ),
                                
                                Center(
                                  child: Text(
                                    'Our app is here to make things easier for you.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.7
                                    ),),
                                ),
                                SizedBox(height: 15.0,),
                                Center(
                                  child: Text('With just a few taps on your phone, youll have everything you need to provide the best care for you or your loved ones.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                      )
                                  ),
                                ),
                        
                            ],
                          ),
                        ),
    
    
                         Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(image: AssetImage('assets/blood.webp'),
                                  height: 300.0,
                                  width: 300.0,),
                                ),
                                
                                Center(
                                  child: Text(
                                    'Thank you for choosing our home care app',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.7
                                    ),),
                                ),
                                SizedBox(height: 15.0,),
                                Center(
                                  child: Text('Were honored to be a part of your caregiving journey. Lets get started!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15
                                      )
                                  ),
                                ),
                        
                            ],
                          ),
                        ),
    
                        
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != _numPages - 1 ? Expanded(child: Align(alignment: FractionalOffset.bottomRight,
                  child: TextButton(onPressed: () {
                    _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                  }, 
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                        ),
                      SizedBox(width: 10.0),  
                      Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 30.0,),
    
                    ],
                  ),
                  ),
                  ),
                  )
                  : const Text('')
                ],  
              ),
            ),
          ),
        ),
        bottomSheet: _currentPage == _numPages -1 ? Container(
        height: 100.0, width: double.infinity, color: Colors.white,
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text('Get started!',
              style: TextStyle(
                color: Color(0xFF398AE5),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ), 
               ),
          ),
        ),
      )
      :const Text(''),
      ),
    );
  }
}