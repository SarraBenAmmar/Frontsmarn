import 'package:flutter/material.dart';

class StudentForm extends StatelessWidget {
  const StudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Form'),
      ),
      body: const Center(
        child:  Text('This is the student form page'),
      ),
    );
  }
}