import 'package:flutter/material.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _classController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Fond noir
      appBar: AppBar(
        backgroundColor: const Color(0xFFB414A4), // Couleur mauve de l'AppBar
        title:
            const Text('Student Form', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    'Student Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Texte en blanc
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Champ de classe
                  TextFormField(
                    controller: _classController,
                    decoration: const InputDecoration(
                      labelText: 'Class',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Color(0xFFB414A4)), // Couleur mauve du label
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xFFB414A4)), // Bordure mauve lors du focus
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the class';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Champ de clé
                  TextFormField(
                    controller: _keyController,
                    decoration: const InputDecoration(
                      labelText: 'Key to Connect',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(
                          color: Color(0xFFB414A4)), // Couleur mauve du label
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xFFB414A4)), // Bordure mauve lors du focus
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the key to connect';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Bouton de soumission
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFB414A4), // Couleur mauve du bouton
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // Padding du bouton
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
