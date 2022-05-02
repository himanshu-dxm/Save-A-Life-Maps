import 'package:flutter/material.dart';
import 'package:save_a_life_maps/widgets/common_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users.add(
      {
        'name':"ABC",
        "age":"25"
      }
    ).then((value) => print("User Added"))
        .catchError((error)=>print("Error "));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save A Life Maps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextFormField(
                decoration: CommonStyles.textFieldStyle("Enter Phone"),
                initialValue: '',
              ),
            ),
            SizedBox(height: 16,),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  print("Hi");
                  // addUser();
                  print("Bye");
                },
                child: Text("Login"),
              ),
            ),
          ],
        )
      ),
    );
  }
}
