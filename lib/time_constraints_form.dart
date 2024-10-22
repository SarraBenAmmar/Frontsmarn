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
      appBar: AppBar(title: const Text("Manage Time Constraints")),
      body: Center(
        // Centre le formulaire
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap:
                  true, // Permet de centrer la liste en fonction de son contenu
              children: [
                const Text(
                  "Time Constraints",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center, // Centrage du texte
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _timeRangeController,
                  decoration: const InputDecoration(
                    labelText: "Time Range",
                    border: OutlineInputBorder(),
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
