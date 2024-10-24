import 'package:flutter/material.dart';
import 'package:smarn/student_dashboard.dart'; // Import the new student dashboard

class ManageStudentsForm extends StatefulWidget {
  const ManageStudentsForm({super.key});

  @override
  _ManageStudentsFormState createState() => _ManageStudentsFormState();
}

class _ManageStudentsFormState extends State<ManageStudentsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();

  @override
  void dispose() {
    _studentNameController.dispose();
    _studentIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Students"),
        backgroundColor: const Color(0xFFB414A4), // Purple AppBar
      ),
      body: Container(
        color: const Color(0xFFF3E5F5), // Light purple background
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    "Student Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Dark purple text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _studentNameController,
                    decoration: const InputDecoration(
                      labelText: "Student Name",
                      labelStyle: TextStyle(
                        color: Color(0xFF6A1B9A), // Dark purple label
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              Color(0xFFB414A4), // Purple border when focused
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter student name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _studentIdController,
                    keyboardType: TextInputType.number, // Set input type
                    decoration: const InputDecoration(
                      labelText: "Student ID",
                      labelStyle: TextStyle(
                        color: Color(0xFF6A1B9A), // Dark purple label
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB414A4), // Purple border on focus
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter student ID";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to the student dashboard on successful login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentDashboard(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB414A4), // Purple button
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white, // White button text
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
