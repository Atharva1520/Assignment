import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/phone.dart';

// ignore: must_be_immutable
class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final otpTextControllers = List.generate(6, (_) => TextEditingController());
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'OTP Verification',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "We have Sent Otp Verification Code to",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                  (index) => buildOTPTextField(index),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  onPressed: () async {
                    try {
                      PhoneAuthCredential phoneAuthCredential =
                          PhoneAuthProvider.credential(
                        verificationId: LoginScreen.verify,
                        smsCode: otpTextControllers.toString(),
                      );
                      await auth.signInWithCredential(phoneAuthCredential);
                      Navigator.pushNamed(context, 'dataadd');
                    } catch (exception) {
                      print(exception.toString());
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Resend Again",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOTPTextField(int index) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          controller: otpTextControllers[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) {
            if (value.isNotEmpty && index < 5) {
              // Move focus to the next input box when a digit is entered.
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
