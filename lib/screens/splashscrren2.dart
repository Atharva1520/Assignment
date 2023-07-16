import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/swipper');
    });
    return const Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.icecream,
              size: 150,
              color: Color.fromARGB(255, 240, 224, 177),
            ),
            SizedBox(height: 16.0),
            Text(
              'Craft My Plate',
              style: TextStyle(
                color: Color.fromARGB(255, 240, 224, 177),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You Customize , We eater',
              style: TextStyle(
                  color: Color.fromARGB(255, 240, 224, 177),
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
