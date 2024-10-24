import 'package:flutter/material.dart';
import 'package:smarn/teacher_dashboard.dart'; // Import the new dashboard

class ManageTeachersForm extends StatefulWidget {
  const ManageTeachersForm({super.key});

  @override
  _ManageTeachersFormState createState() => _ManageTeachersFormState();
}

class _ManageTeachersFormState extends State<ManageTeachersForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _teacherNameController = TextEditingController();
  final TextEditingController _teacherIdController = TextEditingController();

  @override
  void dispose() {
    _teacherNameController.dispose();
    _teacherIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Teachers"),
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
                    "Teacher Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Dark purple text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _teacherNameController,
                    decoration: const InputDecoration(
                      labelText: "Teacher Name",
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
                        return "Please enter teacher name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _teacherIdController,
                    keyboardType: TextInputType.number, // Set input type
                    decoration: const InputDecoration(
                      labelText: "Teacher ID",
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
                        return "Please enter teacher ID";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to the dashboard on successful login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeacherDashboard(),
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
