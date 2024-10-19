import 'package:flutter/material.dart';

class StudentForm extends StatelessWidget {
  const StudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFC0EEF2),
        title: const Text('Student Form'),
      ),
      body: const Center(
        child:  Text('This is the student form page'),
      ),
    );
  }
}