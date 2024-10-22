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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Timetables")),
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
                const Text("Timetable Information",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _classController,
                  decoration: const InputDecoration(
                    labelText: "Class",
                    border: OutlineInputBorder(),
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter subject";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Timetable Saved")),
                      );
                    }
                  },
                  child: const Text("Save Timetable"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
