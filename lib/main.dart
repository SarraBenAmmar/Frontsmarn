import 'package:flutter/material.dart';
import 'package:smarn/user_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taki Academy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectionPage(),
    );
  }
}







































