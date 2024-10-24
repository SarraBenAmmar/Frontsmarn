import 'package:flutter/material.dart';

class ManagePersonnelInformationForm extends StatefulWidget {
  const ManagePersonnelInformationForm({super.key});

  @override
  _ManagePersonnelInformationFormState createState() =>
      _ManagePersonnelInformationFormState();
}

class _ManagePersonnelInformationFormState
    extends State<ManagePersonnelInformationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _personnelNameController =
      TextEditingController();
  final TextEditingController _personnelIdController = TextEditingController();

  bool isSaved = false; // Track if personnel information has been saved
  bool isModifying = false; // Track if the user is in modifying mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Personnel Information"),
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
                    "Personnel Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Dark purple text
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _personnelNameController,
                    decoration: const InputDecoration(
                      labelText: "Personnel Name",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Color(0xFF6A1B9A), // Dark purple label
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              Color(0xFFB414A4), // Purple border when focused
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter personnel name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _personnelIdController,
                    decoration: const InputDecoration(
                      labelText: "Personnel ID",
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                        color: Color(0xFF6A1B9A), // Dark purple label
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFB414A4), // Purple border on focus
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter personnel ID";
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
                                  content: Text("Personnel Information Saved")),
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
                                              "Modify Personnel Information")),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Modifications Saved")),
                                    );
                                  }
                                }
                              }
                            : null, // Disable if no info has been saved
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
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
                                // Logic to remove personnel information
                                setState(() {
                                  _personnelNameController.clear();
                                  _personnelIdController.clear();
                                  isSaved = false; // Mark as not saved
                                  isModifying = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Personnel Information Removed")),
                                );
                              }
                            : null, // Disable if no info has been saved
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // Red button for delete
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
