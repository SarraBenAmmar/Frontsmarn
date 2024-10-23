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
      appBar: AppBar(
        title: const Text("Manage Timetables"),
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
                    "Timetable Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF023E8A), // Couleur du titre
                    ),
                    textAlign: TextAlign.center, // Centrer le texte
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _classController,
                    decoration: InputDecoration(
                      labelText: "Class",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Couleur de l'étiquette
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
                    decoration: InputDecoration(
                      labelText: "Subject",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Couleur de l'étiquette
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
