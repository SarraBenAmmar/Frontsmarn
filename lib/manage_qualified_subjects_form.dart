import 'package:flutter/material.dart';

class ManageQualifiedSubjectsForm extends StatefulWidget {
  const ManageQualifiedSubjectsForm({super.key});

  @override
  _ManageQualifiedSubjectsFormState createState() =>
      _ManageQualifiedSubjectsFormState();
}

class _ManageQualifiedSubjectsFormState
    extends State<ManageQualifiedSubjectsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _subjectCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Qualified Subjects"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color(0xFFF2F2F2),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Text(
                    "Qualified Subject Information",
                    style: TextStyle(fontSize: 20, color: Color(0xFF023E8A)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _subjectNameController,
                    decoration: InputDecoration(
                      labelText: "Subject Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
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
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
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
                          const SnackBar(
                              content: Text("Qualified Subject Saved")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Save Qualified Subject"),
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
