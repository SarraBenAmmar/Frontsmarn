import 'package:flutter/material.dart';
import 'package:smarn/student_form.dart';
import 'package:smarn/teacher_form.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smarn'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have the choice between calculating the guardian or student',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Guardian Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TeacherForm()),
                    );
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.group, size: 60, color: Colors.blue),
                      SizedBox(height: 10),
                      Text('And me', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
                const SizedBox(width: 40), // Space between the two buttons
                // Pupil Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudentForm()),
                    );
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.school, size: 60, color: Colors.blue),
                      SizedBox(height: 10),
                      Text('Pupil', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Refer to the home page'),
            ),
          ],
        ),
      ),
    );
  }
}