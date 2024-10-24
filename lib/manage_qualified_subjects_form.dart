import 'package:flutter/material.dart';

class ManageQualifiedSubjectsForm extends StatefulWidget {
  const ManageQualifiedSubjectsForm({super.key});

  @override
  _ManageQualifiedSubjectsFormState createState() =>
      _ManageQualifiedSubjectsFormState();
}

class _ManageQualifiedSubjectsFormState
    extends State<ManageQualifiedSubjectsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _subjectCodeController = TextEditingController();

  bool isSaved = false; // Track if the subject is saved
  bool isModifying = false; // Track if the user is in modifying mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Qualified Subjects"),
        backgroundColor: const Color(0xFFB414A4), // Use purple color
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // Light background color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    "Qualified Subject Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Darker purple
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _subjectNameController,
                    decoration: const InputDecoration(
                      labelText: "Subject Name",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Color(0xFFB414A4), // Purple label
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB414A4), // Focused border color
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
                    decoration: const InputDecoration(
                      labelText: "Subject Code",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Color(0xFFB414A4), // Purple label
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB414A4), // Focused border color
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isSaved = true; // Mark as saved
                              isModifying = false; // End modify mode
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Qualified Subject Saved")),
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
                                              "Modify Subject Information")),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Modifications Saved")),
                                    );
                                  }
                                }
                              }
                            : null, // Disable if no subject has been saved
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.orange, // Orange modify button
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
                                // Logic to remove the subject
                                setState(() {
                                  _subjectNameController.clear();
                                  _subjectCodeController.clear();
                                  isSaved = false; // Mark as not saved
                                  isModifying = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Subject Removed")),
                                );
                              }
                            : null, // Disable if no subject has been saved
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
