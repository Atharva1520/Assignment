// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String verify = "";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              color: Colors.deepPurple,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Login or SignUp',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: phoneController,
                      onChanged: (value) {
                        setState(() {
                          phoneController.text = value;
                        });
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixText: '+91 ',
                        prefixStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        hintText: 'Enter phone number',
                        hintStyle: const TextStyle(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: InkWell(
                      child: const Text(
                        'Continue',
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () async {
                        FirebaseAuth _auth = FirebaseAuth.instance;
                        _auth.verifyPhoneNumber(
                          phoneNumber: "+91" + phoneController.text,
                          timeout: const Duration(seconds: 60),
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {
                            print('Verification failed: ${e.message}');
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            print('Verification code sent to your phone.');
                            LoginScreen.verify = verificationId;
                            phoneNumber = phoneController.text;
                            Navigator.pushNamed(
                              context,
                              "/verify",
                            );
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            print('Auto retrieval timeout. Please try again.');
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Column(children: [
                const Text("By Continuing, you agree to our"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Terms Of Service",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
