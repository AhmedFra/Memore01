import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Doctor/onboarding_screens.dart';
import 'Driver/homepage.dart';
import 'Patient/Task_sjedule/pagemedcine.dart';
import 'Patient/bottom_homepage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () =>  OnboardingScreenHomecare()),
        GetPage(name: '/addpage', page: () => const Addpage()),
      ],
    );
  }
}
