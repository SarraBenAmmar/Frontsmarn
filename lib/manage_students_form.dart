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
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color(0xFFF2F2F2),
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
                      color: Color(0xFF023E8A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _studentNameController,
                    decoration: InputDecoration(
                      labelText: "Student Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
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
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
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
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
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
