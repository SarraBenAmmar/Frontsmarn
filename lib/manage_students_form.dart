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
      appBar: AppBar(
        title: const Text("Manage Students"),
        backgroundColor: Colors.blue, // Couleur de l'AppBar
      ),
      body: Container(
        color: const Color(0xFFF2F2F2), // Couleur de fond
        child: Center(
          // Utilisation du widget Center pour centrer le contenu
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap:
                    true, // Permet de réduire la taille du ListView pour le centrer
                children: [
                  const Text(
                    "Student Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF023E8A), // Couleur du titre
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _studentNameController,
                    decoration: InputDecoration(
                      labelText: "Student Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Couleur de l'étiquette
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
                    decoration: InputDecoration(
                      labelText: "Student ID",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Couleur de l'étiquette
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Couleur de fond du bouton
                      foregroundColor:
                          Colors.white, // Couleur du texte du bouton
                    ),
                    child: const Text("Save Student"),
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
