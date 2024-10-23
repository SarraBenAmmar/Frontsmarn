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
      appBar: AppBar(
        title: const Text("Manage Subjects"),
        backgroundColor: Colors.blue, // Couleur de l'AppBar
      ),
      body: Container(
        color: const Color(0xFFF2F2F2), // Couleur de fond
        child: Center(
          // Utilisation de Center pour centrer le contenu
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap:
                    true, // Ajuste la taille du ListView pour le centrer
                children: [
                  const Text(
                    "Subject Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF023E8A), // Couleur du titre
                    ),
                    textAlign: TextAlign.center, // Centrer le texte
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _subjectNameController,
                    decoration: InputDecoration(
                      labelText: "Subject Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Couleur de l'étiquette
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
                    decoration: InputDecoration(
                      labelText: "Subject Code",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Couleur de l'étiquette
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Couleur de fond du bouton
                      foregroundColor:
                          Colors.white, // Couleur du texte du bouton
                    ),
                    child: const Text("Login"),
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
