import 'package:flutter/material.dart';
import 'package:smarn/Home.dart'; // Ensure you have this file
import 'package:smarn/home_screen.dart'; // Ensure you have this file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMARN',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Choose one home screen to display
      home:
          const HomePage(), // or   const HomeScreen()depending on your preference
    );
  }
}
