
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import '';
import 'Task_sjedule/mybutton.dart';
import 'Task_sjedule/pagemedcine.dart';

class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
   void _showBottomSheet2() {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                // Handle cancel appointment button press
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  ),
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                height: 55,
                child: Text(
                  'Edit ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle edit appointment button press
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
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
                  'Cancel ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle close button press
                Navigator.pop(context);
              },
              child: Container(
                 margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey
                  ),
                  color: Color.fromARGB(255, 199, 199, 199),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  'Close',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
  DateTime _selectedDate = DateTime.now();
  // final _taskController = Get.put(meddcinecontroller());
  var notifyHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      
      body: 

          Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 10,),
              _addCalender(),
              _addMycalender(),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                return buildAppointmentContainer(context);
                           },
                        ),
              ),
            
            ],
          ),
       
    );
  }

  // _showTasks(){
  //   return Expanded(
  //     child: Obx(() {
  //       return ListView.builder(
  //         itemCount: _taskController.taskList.length,
  //         itemBuilder: (_, context){
  //           print(_taskController.taskList.length);
  //             return Container(
  //               width: 200,
  //               height: 100,
  //               color: Colors.green,
  //                 margin: EdgeInsets.only(bottom: 10),

  //             );
  //         });
  //     },)
    
  //   );
  // }

  _addCalender() {
    return Container(
                margin: EdgeInsets.only(left: 20 ,right: 20,top: 10),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(DateFormat.yMMMEd().format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),)
                        ],
                      ),
                    ),
                    Mybutton(label:"+ Add Medcine" ,onTap:()async {
                     await Get.to(Addpage());
                    //  _taskController.getTasks();

                      
                      } ),
                  ],
                ),
              );
  }
  _addMycalender(){
    return Container(
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

Widget buildAppointmentContainer(BuildContext context) {
    return InkWell(
      onTap:() {
        _showBottomSheet2();
  },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 20,right: 20),
        height: 130,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 240, 240),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              top: 15,
              right: 15,
              child:  Expanded(
                        child: Image.asset(
                          'capsule22.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Omega 3',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      '1 capsule | 300mg',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 124,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                            color: Colors.red,
                             width: 2.0,
                             ),  
                            color: Color.fromARGB(255, 250, 148, 130),
                          ),
                          child: Center(
                            child: Text(
                              'Before Eating',
                              style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 250, 82, 69)),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          width: 124,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color.fromARGB(255, 206, 205, 205),
                          ),
                          child: Center(
                            child: Text(
                              'Breakfast',
                              style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 139, 136, 136)),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            width: 124,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color.fromARGB(255, 101, 185, 253),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                  showModalBottomSheet(
                              context: context,
                             builder: (context) {
                              return buildBottomSheetContent();
                                    },
                                   );
                                    },
                              child: Center(
                                child: Text(
                                  'View Details',
                                  style: TextStyle(fontSize: 16,color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
  }





Widget buildBottomSheetContent() {
    return Container(
      height: 300,
      child: Column(
        children: [
          // Add your bottom sheet content here
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Omega 3',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      'Program',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                          'Total 4 weeks | 1 week left',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),),
                     Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                          'Total 120 capsules | 40 capsules left',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),),
                          Row(
                            children: [
                              Text(
                      'Before Eating :',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5,),
                         Text(
                      'Breakfast',
                      style: TextStyle(
                        color: Color.fromARGB(255, 143, 139, 139),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                            ],
                          ),
                  ],
                ),
              ),
              SizedBox(width: 10,),
              
                      Expanded(
                        child: Image.asset(
                          'Omega323.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
            ],
          ),
          
          // Add more widgets to display the details of the appointment
          
          GestureDetector(
                onTap: () {
                  // Handle edit appointment button press
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  width: MediaQuery.of(context).size.width*0.9,
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
                    'Close',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
          
        ],
      ),
    );
  }



}



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      height: preferredSize.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF478FE0),
            Color(0xFF398AE5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Medicine Reminder',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 24.0,
            ),
          ),
          // Add any other widgets or icons here
        ],
      ),
    );
  }
}
  
class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                // Handle cancel appointment button press
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  ),
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                height: 55,
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle edit appointment button press
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
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
                  'Delete',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle close button press
                Navigator.pop(context);
              },
              child: Container(
                 margin: EdgeInsets.symmetric(vertical: 4),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey
                  ),
                  color: Color.fromARGB(255, 199, 199, 199),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  'Close',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  
