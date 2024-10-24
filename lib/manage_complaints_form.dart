import 'package:flutter/material.dart';

class ManageComplaintsForm extends StatefulWidget {
  const ManageComplaintsForm({super.key});

  @override
  _ManageComplaintsFormState createState() => _ManageComplaintsFormState();
}

class _ManageComplaintsFormState extends State<ManageComplaintsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _complaintTitleController =
      TextEditingController();
  final TextEditingController _complaintDetailsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Complaints"),
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
                shrinkWrap: true, // Adjust ListView size for centering
                children: [
                  const Text(
                    "Complaint Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Dark purple title
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _complaintTitleController,
                    decoration: const InputDecoration(
                      labelText: "Complaint Title",
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
                        return "Please enter complaint title";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _complaintDetailsController,
                    decoration: const InputDecoration(
                      labelText: "Complaint Details",
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
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter complaint details";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Complaint Submitted"),
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
                        color: Colors.white, // White text on button
                      ),
                    ),
                    child: const Text("Submit Complaint"),
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
