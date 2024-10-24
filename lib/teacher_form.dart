import 'package:flutter/material.dart';

class TeacherForm extends StatelessWidget {
  const TeacherForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), // Couleur de fond
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 161, 2, 164), // Couleur de l'AppBar
        title: const Text(
          'Teacher Form',
          style: TextStyle(
            color: Colors.white, // Couleur du texte
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'This is the Teacher form page',
          style: TextStyle(
            fontSize: 18,
            color: const Color.fromARGB(255, 161, 2, 164), // Couleur du texte
          ),
        ),
      ),
    );
  }
}
