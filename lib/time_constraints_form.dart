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
      backgroundColor: const Color(0xFFF2F2F2), // Light background color
      appBar: AppBar(
        backgroundColor: Colors.blue, // Same AppBar color as HomeScreen
        title: const Text(
          "Manage Time Constraints",
          style: TextStyle(color: Colors.white), // White text for AppBar title
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
                    color: Color(0xFF023E8A), // Same text color as HomeScreen
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _timeRangeController,
                  decoration: const InputDecoration(
                    labelText: "Time Range",
                    labelStyle: TextStyle(
                      color: Color(0xFF023E8A), // Consistent label color
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue, // Blue border when focused
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
                    backgroundColor:
                        Colors.blue, // Same button color as HomeScreen
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white, // White button text
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
