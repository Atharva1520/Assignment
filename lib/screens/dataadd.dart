import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataAdd extends StatefulWidget {
  const DataAdd({super.key});

  @override
  State<DataAdd> createState() => _DataAddState();
}

class _DataAddState extends State<DataAdd> {
  final TextEditingController textController1 = TextEditingController();
  final TextEditingController textController2 = TextEditingController();
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return usersCollection.add({
      'firstName': textController1.text,
      'lastName': textController2.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 150),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Just a Step Away!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: textController1,
              decoration: const InputDecoration(
                hintText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: textController2,
              decoration: const InputDecoration(
                hintText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 200),
            Container(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  addUser();
                  Navigator.pushNamed(context, 'main');
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
