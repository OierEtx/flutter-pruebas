import 'package:flutter/material.dart';
import 'package:tutorial/screens/home.dart';
// ignore: depend_on_referenced_packages
// import 'package:firebase_core/firebase_core.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home'),
      debugShowCheckedModeBanner: false, // Visualizar debug Flag
    );
  }
}