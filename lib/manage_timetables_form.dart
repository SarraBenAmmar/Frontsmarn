import 'package:flutter/material.dart';

class ManageTimetablesForm extends StatefulWidget {
  const ManageTimetablesForm({super.key});

  @override
  _ManageTimetablesFormState createState() => _ManageTimetablesFormState();
}

class _ManageTimetablesFormState extends State<ManageTimetablesForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  bool isSaved = false; // Track if the timetable is saved
  bool isModifying = false; // Track if the user is modifying the timetable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Timetables"),
        backgroundColor: const Color(0xFFB414A4), // Updated to purple AppBar
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // Light purple background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true, // Center ListView
                children: [
                  const Text(
                    "Timetable Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Darker purple for title text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _classController,
                    decoration: const InputDecoration(
                      labelText: "Class",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Color(0xFF6A1B9A)), // Darker purple for label
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter class";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _subjectController,
                    decoration: const InputDecoration(
                      labelText: "Subject",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Color(0xFF6A1B9A)), // Darker purple for label
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter subject";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isSaved = true; // Mark timetable as saved
                              isModifying = false; // End modify mode
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Timetable Saved")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFB414A4), // Purple button
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white, // White button text
                          ),
                        ),
                        child: const Text("Save"),
                      ),
                      ElevatedButton(
                        onPressed: isSaved
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isModifying = !isModifying;
                                  });
                                  if (isModifying) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Modify Timetable Information")),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Modifications Saved")),
                                    );
                                  }
                                }
                              }
                            : null, // Disable if no timetable is saved
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange, // Modify button color
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white, // White button text
                          ),
                        ),
                        child: Text(isModifying ? "Save Changes" : "Modify"),
                      ),
                      ElevatedButton(
                        onPressed: isSaved
                            ? () {
                                setState(() {
                                  _classController.clear();
                                  _subjectController.clear();
                                  isSaved = false; // Mark as not saved
                                  isModifying = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Timetable Removed")),
                                );
                              }
                            : null, // Disable if no timetable is saved
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Red remove button
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.white, // White button text
                          ),
                        ),
                        child: const Text("Remove"),
                      ),
                    ],
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
