import 'package:flutter/material.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _classController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.blue, // Changed AppBar color to blue
        title: const Text('Student Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            const Text(
              'Student Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Class Field
            TextFormField(
              controller: _classController,
              decoration: const InputDecoration(
                labelText: 'Class',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the class';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Key Field
            TextFormField(
              controller: _keyController,
              decoration: const InputDecoration(
                labelText: 'Key to Connect',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the key to connect';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form Submitted')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Changed button color to blue
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white, // Text color to white
                ),
              ),
            ),
            const SizedBox(height: 30),
          ]),
        ),
      ),
    );
  }
}
