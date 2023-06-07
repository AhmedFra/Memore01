

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart' as FlutterMaterial;


import 'inputfield.dart';
import 'mybutton.dart';
class Addpage extends StatefulWidget {


  const Addpage({Key? key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  // final meddcinecontroller _taskController = Get.put(meddcinecontroller());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind =5;
  List<int> remindList=[
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat ="None";
  List<String> repeatList=[
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _selectedColor=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Container(
        padding: EdgeInsets.only(left: 20 ,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Meddcine",style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
              Muinput(title:"Title" ,hint:"Enter your title " ,controller: _titleController,),
              Muinput(title:"Note" ,hint:"Enter your note " ,controller: _noteController,),
              Muinput(title:"Date" ,hint:DateFormat.yMd().format(_selectedDate),
              widget:
               IconButton(
                icon:Icon( Icons.calendar_today_outlined ,
                color: Colors.grey,),
                
                onPressed:() {
                  _getDateFromUser();
                })),
                Row(
                  children: [
                    Expanded(child: 
                    Muinput(title:"Start Time" ,
                    hint:_startTime ,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeFromUser(isStartime: true);
                      },
                      icon: Icon(
                        Icons.access_alarms_rounded,
                        color: Colors.grey,
                      ),
                    )
                    ),
                    ),
                    SizedBox(width: 12,),
                    Expanded(child: 
                    Muinput(title:"End Time" ,
                    hint: _endTime ,
                    widget: IconButton(
                      onPressed: () {
                          _getTimeFromUser(isStartime: false);
                      },
                      icon: Icon(
                        Icons.access_alarms_rounded,
                        color: Colors.grey,
                      ),
                    )
                    ),
                    )
                  ],
                ),
                Muinput(title:"Remain" ,hint:"$_selectedRemind minutes early" ,
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down,
                  color: Colors.grey,),
                  iconSize: 32,
                  elevation: 4,
                  underline:Container(height: 0) ,
                  onChanged:(String? newValue){
                    setState(() {
                      _selectedRemind=int.parse(newValue!);
                    });
                  } ,
                  items:remindList.map<DropdownMenuItem<String>>((int value){
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),

                    );
                  }
                  ).toList(),
                )
                 ,),
                 Muinput(title:"Repeat" ,hint:"$_selectedRepeat " ,
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down,
                  color: Colors.grey,),
                  iconSize: 32,
                  elevation: 4,
                  underline:Container(height: 0) ,
                  onChanged:(String? newValue){
                    setState(() {
                      _selectedRepeat=newValue!;
                    });
                  } ,
                  items:repeatList.map<DropdownMenuItem<String>>((String? value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value!,style: TextStyle(color: Colors.grey),),

                    );
                  }
                  ).toList(),
                )
                 ,),
                 SizedBox(height: 18,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     _colorPallete(),
                     Padding(
                       padding: const EdgeInsets.only(top: 25),
                       child: Mybutton(label:"Add Medcine" ,onTap:() =>_validdateDate() ),
                     ),
                      ],
                    )
                  ],
                 )
            
          
        ),

      ),
    );
    
  }

  FlutterMaterial.AppBar _appbar(BuildContext context) {
    return FlutterMaterial.AppBar(
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
          
        ],
      ),
    );
  }

_validdateDate(){
  if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
    // _addTaskYoDb();
    Get.back();
  }else if(_titleController.text.isEmpty||_noteController.text.isEmpty){
    Get.snackbar("Required", "All fields are required !",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    icon:Icon(Icons.warning_amber_rounded) );
  }
}
  // _addTaskYoDb() async{
  //   int value =await _taskController.addTask(
  //     task:Task(
  //     note: _noteController.text,
  //     title: _titleController.text,
  //     date: DateFormat.yMd().format(_selectedDate),
  //     startTime: _startTime,
  //     endTime: _endTime,
  //     remind: _selectedRemind,
  //     Repeat: _selectedRepeat,
  //     color: _selectedColor,
  //     isCompleted: 0, 
      
  //   )

  //   );
  //   print("My id is "+"$value");
  // }

  _colorPallete(){
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Color",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                            SizedBox(height: 8,),
                            Wrap(
                              children: List<Widget>.generate(
                                 3 , (int index) {
                                   return GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _selectedColor=index;
                                      });
                                    },
                                     child: Padding(
                                       padding: const EdgeInsets.only(right: 8),
                                       child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor: index==0?Colors.pink:index==1?Colors.orange:Colors.green,
                                          child:_selectedColor==index? Icon(Icons.done,
                                          color: Colors.white,
                                          size: 16,
                                          ):Container(),
                                       ),
                                     ),
                                   );
                                 }))
                                
                      ]
                            );
  }
  _getDateFromUser() async { // Pass the context as a parameter
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime(2023),
    );
      
    // Handle the selected date
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }
  _getTimeFromUser({required bool isStartime}) async {
    var pickedTime =await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if(pickedTime==null) {
      print("Time canceld");

    }else if(isStartime==true){
        setState(() {
          _startTime=_formatedTime;
        });
    }else if(isStartime==false){
      setState(() {
        _endTime=_formatedTime;
      });

    }
  }
  _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
     initialTime: TimeOfDay(

      hour: int.parse(_startTime.split(":")[0]),
       minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }
}