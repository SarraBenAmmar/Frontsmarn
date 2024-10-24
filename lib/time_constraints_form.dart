import 'package:flutter/material.dart';

class TimeConstraintsForm extends StatefulWidget {
  const TimeConstraintsForm({super.key});

  @override
  _TimeConstraintsFormState createState() => _TimeConstraintsFormState();
}

class _TimeConstraintsFormState extends State<TimeConstraintsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _timeRangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7F6), // Light purple background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFB414A4), // Purple AppBar
        title: const Text(
          "Manage Time Constraints",
          style: TextStyle(color: Colors.white), // White AppBar text
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  "Time Constraints",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6A1B9A), // Darker purple for the title
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _timeRangeController,
                  decoration: const InputDecoration(
                    labelText: "Time Range",
                    labelStyle: TextStyle(
                      color: Color(0xFF6A1B9A), // Darker purple for the label
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFB414A4), // Purple border when focused
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter time range";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Time Constraint Saved")),
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
                      color: Colors.white, // White text for the button
                    ),
                  ),
                  child: const Text("Save Time Constraint"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
