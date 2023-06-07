import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart' as FlutterMaterial;
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';



import '../Task_sjedule/inputfield.dart';
import '../Task_sjedule/mybutton.dart';
import 'map.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  // final meddcinecontroller _taskController = Get.put(meddcinecontroller());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];
  int _selectedColor = 0;
 LatLng? _selectedLocation;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pick an Appointment",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Muinput(
                title: "Name",
                hint: "Enter your title ",
                controller: _titleController,
              ),
              Muinput(
                title: "Note",
                hint: "Enter your note ",
                controller: _noteController,
              ),
              Muinput(
                title: "Date",
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Muinput(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartime: true);
                        },
                        icon: Icon(
                          Icons.access_alarms_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Muinput(
                      title: "End Time",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartime: false);
                        },
                        icon: Icon(
                          Icons.access_alarms_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 12),
              Muinput(
                title: "SpecialInstructions",
                hint: "Enter your note ",
                controller: _noteController,
              ),
              SizedBox(width: 12),
              Muinput(
                title: "Address",
                hint: _selectedLocation?.toString() ?? '',
                widget: IconButton(
                  onPressed: () {
                    _getLocationFromMap();
                  },
                  icon: Icon(
                    Icons.map,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Mybutton(
                      label: "Confirm",
                      onTap: () => _validateData(),
                    ),
                  ),
                ],
              ),
            ],
          ),
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

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      // _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        icon: Icon(Icons.warning_amber_rounded),
      );
    }
  }

  // _addTaskToDb() async {
  //   int value = await _taskController.addTask(
  //     task: Task(
  //       note: _noteController.text,
  //       title: _titleController.text,
  //       date: DateFormat.yMd().format(_selectedDate),
  //       startTime: _startTime,
  //       endTime: _endTime,
  //       remind: _selectedRemind,
  //       Repeat: _selectedRepeat,
  //       color: _selectedColor,
  //       isCompleted: 0,
  //     ),
  //   );
  //   print("My id is " + "$value");
  // }
_getLocationFromMap() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are disabled, handle accordingly
    print('Location services are disabled');
    return;
  }

  // Request location permission
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    // Location permission is permanently denied, handle accordingly
    print('Location permission is permanently denied');
    return;
  }

  if (permission == LocationPermission.denied) {
    // Location permission is denied, request it
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      // Location permission is still denied, handle accordingly
      print('Location permission is denied');
      return;
    }
  }

  // Location permission is granted, proceed to get user location
  Position? position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  if (position != null) {
    LatLng latLng = LatLng(position.latitude, position.longitude);
    _openMapWithLocation(latLng);
  } else {
    // Handle error when getting user location
    print('Error getting user location');
  }
}
  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime(2023),
    );

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartime}) async {
    var pickedTime = await _showTimePicker();
    String _formattedTime = pickedTime!.format(context);
    if (pickedTime == null) {
      print("Time cancelled");
    } else if (isStartime == true) {
      setState(() {
        _startTime = _formattedTime;
      });
    } else if (isStartime == false) {
      setState(() {
        _endTime = _formattedTime;
      });
    }
  }

  Future<TimeOfDay?> _showTimePicker() async {
    final now = TimeOfDay.now();
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  
  _openMapWithLocation(LatLng initialLocation) async {
    final selectedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(initialLocation: initialLocation),
      ),
    );

    if (selectedLocation != null) {
      setState(() {
        _selectedLocation = selectedLocation;
      });
    }
  }
}
