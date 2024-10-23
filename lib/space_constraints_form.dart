import 'package:flutter/material.dart';

class SpaceConstraintsForm extends StatefulWidget {
  const SpaceConstraintsForm({super.key});

  @override
  _SpaceConstraintsFormState createState() => _SpaceConstraintsFormState();
}

class _SpaceConstraintsFormState extends State<SpaceConstraintsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _spaceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Space Constraints"),
        backgroundColor: Colors.blue, // Couleur de l'AppBar
      ),
      body: Container(
        color: const Color(0xFFF2F2F2), // Couleur de fond
        child: Center(
          // Centre le formulaire dans l'écran
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap:
                    true, // Adapte la taille du ListView pour centrer son contenu
                children: [
                  const Text(
                    "Space Constraints",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF023E8A), // Couleur du titre
                    ),
                    textAlign: TextAlign.center, // Centrage du texte
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _spaceNameController,
                    decoration: InputDecoration(
                      labelText: "Space Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Couleur de l'étiquette
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter space name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Space Constraint Saved")),
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
