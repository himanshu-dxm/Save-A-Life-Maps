import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:save_a_life_maps/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Save A Life Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login_Page(),
    );
  }
}
