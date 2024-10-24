import 'package:flutter/material.dart';

class ManageSubjectsForm extends StatefulWidget {
  const ManageSubjectsForm({super.key});

  @override
  _ManageSubjectsFormState createState() => _ManageSubjectsFormState();
}

class _ManageSubjectsFormState extends State<ManageSubjectsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _subjectCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Subjects"),
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
                    "Subject Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Darker purple text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _subjectNameController,
                    decoration: InputDecoration(
                      labelText: "Subject Name",
                      labelStyle: const TextStyle(
                        color: Color(0xFF6A1B9A), // Darker purple label
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB414A4), // Purple border on focus
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter subject name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _subjectCodeController,
                    decoration: InputDecoration(
                      labelText: "Subject Code",
                      labelStyle: const TextStyle(
                        color: Color(0xFF6A1B9A), // Darker purple label
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB414A4), // Purple border on focus
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter subject code";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Subject Saved")),
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
                    child: const Text("Save Subject"),
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
