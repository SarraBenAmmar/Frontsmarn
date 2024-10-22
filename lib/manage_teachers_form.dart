import 'package:flutter/material.dart';

class ManageTeachersForm extends StatefulWidget {
  const ManageTeachersForm({super.key});

  @override
  _ManageTeachersFormState createState() => _ManageTeachersFormState();
}

class _ManageTeachersFormState extends State<ManageTeachersForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _teacherNameController = TextEditingController();
  final TextEditingController _teacherIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Teachers")),
      body: Center(
        // Centrer le formulaire
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap:
                  true, // Ajuste la taille du ListView pour qu'il soit centré
              children: [
                const Text(
                  "Teacher Information",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center, // Centrer le texte
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _teacherNameController,
                  decoration: const InputDecoration(
                    labelText: "Teacher Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter teacher name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _teacherIdController,
                  decoration: const InputDecoration(
                    labelText: "Teacher ID",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter teacher ID";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Teacher Saved")),
                      );
                    }
                  },
                  child: const Text("Save Teacher"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
