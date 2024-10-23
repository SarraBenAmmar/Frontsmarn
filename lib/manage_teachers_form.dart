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
                    "Teacher Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF023E8A),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _teacherNameController,
                    decoration: InputDecoration(
                      labelText: "Teacher Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
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
                    decoration: InputDecoration(
                      labelText: "Teacher ID",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
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
