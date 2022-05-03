import 'package:flutter/material.dart';
import 'package:save_a_life_maps/widgets/common_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  TextEditingController phoneNumberController = new TextEditingController(text: "12345");

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
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: TextFormField(
                key: _globalKey,
                decoration: CommonStyles.textFieldStyle("Enter Phone"),
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
              ),
            ),
            SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
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
