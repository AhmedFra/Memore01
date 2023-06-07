import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int selectedContainerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous page
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Absence Declaration",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: selectedContainerIndex == 0 ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Absence Formula',
                          style: TextStyle(
                            fontSize: 20,
                            color: selectedContainerIndex == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10), // Add spacing between the buttons
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: selectedContainerIndex == 1 ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Declare Absence',
                          style: TextStyle(
                            fontSize: 20,
                            color: selectedContainerIndex == 1 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Add spacing below the buttons
          SizedBox(height: 20),
          selectedContainerIndex == 0
              ? Expanded(
                  child: Column(
                    children: [
                      Container(
                    
                      margin: EdgeInsets.only(top:10,left: 20),
                              height: 35,        
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 150, 153, 155), 
                              borderRadius: BorderRadius.circular(12),         
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Download the Format Below to use to Declare your absence from work.",
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 15),),
                              ),
                              ),
                              SizedBox(height: 10,),
                      Expanded(
                        child: Image.asset(
                          '123.png',
                          width: 600,
                          height: 600,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            // Save functionality
                          },
                          icon: Icon(Icons.save),
                          label: Text('Save'),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                children:[
                  Container(
                    
                      margin: EdgeInsets.only(top:10,left: 20),
                              height: 35,        
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 150, 153, 155), 
                              borderRadius: BorderRadius.circular(12),         
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Please  fill out the form  to declare your absence from work.",
                                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 15),),
                              ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                    
                      margin: EdgeInsets.only(top:10,left: 20),
                              height: 400,        
                              decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255), 
                              borderRadius: BorderRadius.circular(12),         
                              ),
                              child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Expanded(
                                       child: Image.asset(
                                      '123.png',
                                        width: 300,
                                           height: 300,
                                           ),
                                          ),
                                          Expanded(
                                           child: Image.asset(
                                             '123.png',
                                              width: 300,
                                              height: 300,
                                               ),
                                               ),
                                  ],
                                )
                              
                              ),
                              SizedBox(height: 10,),
                  Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            // Save functionality
                          },
                          icon: Icon(Icons.cloud_download),
                          label: Text('Import'),
                        ),
                      ),
                      
                      ]
              ), // Empty container if the absence container is selected
        ],
      ),
    );
  }
}
