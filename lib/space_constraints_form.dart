import 'package:flutter/material.dart';

class SpaceConstraintsForm extends StatefulWidget {
  const SpaceConstraintsForm({super.key});

  @override
  _SpaceConstraintsFormState createState() => _SpaceConstraintsFormState();
}

class _SpaceConstraintsFormState extends State<SpaceConstraintsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _spaceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Space Constraints"),
        backgroundColor: const Color(0xFFB414A4), // Purple AppBar color
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // Light background color
        child: Center(
          // Center the form in the screen
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true, // Adapt ListView size to center its content
                children: [
                  const Text(
                    "Space Constraints",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF6A1B9A), // Darker purple for title
                    ),
                    textAlign: TextAlign.center, // Center the text
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _spaceNameController,
                    decoration: InputDecoration(
                      labelText: "Space Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF6A1B9A)), // Darker purple label
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter space name";
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
                              content: Text("Space Constraint Saved")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFB414A4), // Purple button color
                      foregroundColor: Colors.white, // Button text color
                    ),
                    child: const Text(
                        "Save Space Constraint"), // Updated button text
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
