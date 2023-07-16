import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/splash2');
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
              'Welcome',
              style: TextStyle(
                color: Color.fromARGB(255, 240, 224, 177),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
