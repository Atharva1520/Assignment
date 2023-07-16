import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/SplashScreen.dart';
import 'package:flutter_application_1/screens/dataadd.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/phone.dart';
import 'package:flutter_application_1/screens/splashscrren2.dart';
import 'package:flutter_application_1/screens/swipper.dart';
import 'package:flutter_application_1/screens/verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const SplashScreen(),
        '/splash2': (context) => const SplashScreen2(),
        '/swipper': (context) => const SwiperScreen(),
        '/login': (context) => const LoginScreen(),
        '/verify': (context) => OTPVerificationScreen(),
        '/dataadd': (context) => const DataAdd(),
        '/main': (context) => const HomePage(),
      },
    );
  }
}
