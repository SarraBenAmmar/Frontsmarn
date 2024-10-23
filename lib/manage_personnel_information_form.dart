import 'package:flutter/material.dart';

class ManagePersonnelInformationForm extends StatefulWidget {
  const ManagePersonnelInformationForm({super.key});

  @override
  _ManagePersonnelInformationFormState createState() =>
      _ManagePersonnelInformationFormState();
}

class _ManagePersonnelInformationFormState
    extends State<ManagePersonnelInformationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _personnelNameController =
      TextEditingController();
  final TextEditingController _personnelIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Personnel Information"),
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
                    "Personnel Information",
                    style: TextStyle(fontSize: 20, color: Color(0xFF023E8A)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _personnelNameController,
                    decoration: InputDecoration(
                      labelText: "Personnel Name",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter personnel name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _personnelIdController,
                    decoration: InputDecoration(
                      labelText: "Personnel ID",
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(color: Color(0xFF023E8A)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter personnel ID";
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
                              content: Text("Personnel Information Saved")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Save Personnel Information"),
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
