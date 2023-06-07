import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(DateFormat.yMMMEd().format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),),
                      ) ,
            _calander(),
        Container(
          height: 1000,
          child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
             
          
          return InkWell(
            onTap: (){
              showModalBottomSheet(
                              context: context,
                             builder: (context) {
                              return BottomSheetContent2();
                                    },
                                   );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 20),
              height: 100,
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 229, 235, 238),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Expanded(
                        child: Image.asset(
                          'eaamb.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                        ],
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      color: Colors.black,
                      endIndent: 10,
                      indent: 10,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 7),
                        Text(
                          'Nurse Appoiments',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          '25 rue Larbi Ben Mhidi, 31000, Oran',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text(
                              'specialInstructions: Bring wheelchair',
                              style: TextStyle(
                                
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
              
          },
        ),
        ),
          ],
        ),
      ),
    );
  }


 Widget BottomSheetContent2() {
    return Container(
      
      child: Column(
        children: [
          // Add your bottom sheet content here
          
          Column(
            
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text("Appoiment Details",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                              ),),
                  
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child:

                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                        Text(
                          'Specialist :Nursing',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                       
                     SizedBox(height: 7,),
                     Text(
                      'Patient Name : Mohamed Berkani',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(height: 7,),
                     Text(
                          'Adress :',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                           SizedBox(height: 7,),
                     Text(
                      '25 rue Larbi Ben Mhidi, 31000, Oran',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                     SizedBox(height: 7,),
                    Text(
                         " specialInstructions: Bring wheelchair",
                          style: TextStyle(
                            fontSize: 18,
                            
                            fontWeight: FontWeight.w500,
                          ),),
                           SizedBox(height: 7,),
                          Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset(
                            'map03.png',
                             width: 500,
                             height: 250,
                               ),
                               Padding(
                               padding: const EdgeInsets.only(right: 30),
                                child: GestureDetector(
                                    onTap: () {
          // Handle icon click event
                                         },
                                 child: Container(
                                 decoration: BoxDecoration(
                                    color: Colors.white,
                                   shape: BoxShape.circle,
                                        ),
                                padding: EdgeInsets.all(8),
                                     child: Icon(
                                 Icons.my_location_outlined,
                                       size: 30,
                            color: Colors.blue,
                                     ),
                                  ),
                                  ),
                                 ),
                                 ],
                                ),
                       
                           SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             GestureDetector(
                onTap: () {
                  // Handle edit appointment button press
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.red
                    ),
                    color: Color.fromARGB(255, 247, 81, 69),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    'Report',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(width: 16,),
              GestureDetector(
                onTap: () {
                  // Handle edit appointment button press
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color.fromARGB(255, 54, 152, 244)
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    'Completed',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
                            ],
                          ),
                  ],
                ),
              ),
              
            ],
          ),
          
        
        ],
      ),
    );
  }


_calander(){
  return 
            Container(
              margin: EdgeInsets.only(top:10,left: 20),
              child:
                
               DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectedTextColor: Colors.white,
                selectionColor: Colors.blue,
                dateTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                monthTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                dayTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                onDateChange: (date) {
                  _selectedDate=date;
                },
              ),
            );
}

AppBar _appbar(BuildContext context) {
  return AppBar(
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
        SizedBox(width: 10),
        Text(
          'Upcoming Appointments',
          style: TextStyle(
            color :Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}}