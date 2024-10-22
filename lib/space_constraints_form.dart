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
      appBar: AppBar(title: const Text("Manage Space Constraints")),
      body: Center(
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
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center, // Centrage du texte
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _spaceNameController,
                  decoration: const InputDecoration(
                    labelText: "Space Name",
                    border: OutlineInputBorder(),
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
                        const SnackBar(content: Text("Space Constraint Saved")),
                      );
                    }
                  },
                  child: const Text("Save Space Constraint"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
