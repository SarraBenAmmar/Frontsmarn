import 'package:flutter/material.dart';

class TeacherForm extends StatelessWidget {
  const TeacherForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardian Form'),
      ),
      body: const Center(
        child: Text('This is the guardian form page'),
      ),
    );
  }
}
