import 'package:assessment_mobile_app_project/firebase_options.dart';
import 'package:assessment_mobile_app_project/help.dart';
import 'package:assessment_mobile_app_project/home.dart';
import 'package:assessment_mobile_app_project/iot_controlling.dart';
import 'package:assessment_mobile_app_project/iot_monitoring.dart';
import 'package:assessment_mobile_app_project/landing.dart';
import 'package:assessment_mobile_app_project/login.dart';
import 'package:assessment_mobile_app_project/profile.dart';
import 'package:assessment_mobile_app_project/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      initialRoute :'/' ,
      routes: {
        '/': (context) => const HomePage(),
        '/LoginPage': (context) => const LoginPage(),
        '/SignUpPage': (context) => const SignUpPage(),
        '/IotMonitoringDataPage': (context) => const IotMonitoringDataPage(),
        '/AboutMePage': (context) => const AboutMePage(),
        '/LandingPage': (context) => const LandingPage(),
        '/IotControllingPage': (context) => const IotControllingPage(),
        '/help': (context) => const HelpAndSupportPage(),
      },
    );
  }
}


