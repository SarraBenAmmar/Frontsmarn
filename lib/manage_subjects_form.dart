import 'package:flutter/material.dart';

class ManageSubjectsForm extends StatefulWidget {
  const ManageSubjectsForm({super.key});

  @override
  _ManageSubjectsFormState createState() => _ManageSubjectsFormState();
}

class _ManageSubjectsFormState extends State<ManageSubjectsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _subjectCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Subjects")),
      body: Center(
        // Utilisation de Center pour centrer le contenu
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true, // Ajuste la taille du ListView pour le centrer
              children: [
                const Text(
                  "Subject Information",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center, // Centrer le texte
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _subjectNameController,
                  decoration: const InputDecoration(
                    labelText: "Subject Name",
                    border: OutlineInputBorder(),
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter subject code";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Subject Saved")),
                      );
                    }
                  },
                  child: const Text("Save Subject"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
