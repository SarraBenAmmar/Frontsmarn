import 'package:flutter/material.dart';

class ManageStudentsForm extends StatefulWidget {
  const ManageStudentsForm({super.key});

  @override
  _ManageStudentsFormState createState() => _ManageStudentsFormState();
}

class _ManageStudentsFormState extends State<ManageStudentsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Students")),
      body: Center(
        // Utilisation du widget Center pour centrer le contenu
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap:
                  true, // Permet de réduire la taille du ListView pour le centrer
              children: [
                const Text("Student Information",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _studentNameController,
                  decoration: const InputDecoration(
                    labelText: "Student Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter student name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _studentIdController,
                  decoration: const InputDecoration(
                    labelText: "Student ID",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter student ID";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Student Saved")),
                      );
                    }
                  },
                  child: const Text("Save Student"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
