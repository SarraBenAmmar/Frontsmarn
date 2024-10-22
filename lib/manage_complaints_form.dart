import 'package:flutter/material.dart';

class ManageComplaintsForm extends StatefulWidget {
  const ManageComplaintsForm({super.key});

  @override
  _ManageComplaintsFormState createState() => _ManageComplaintsFormState();
}

class _ManageComplaintsFormState extends State<ManageComplaintsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _complaintTitleController =
      TextEditingController();
  final TextEditingController _complaintDetailsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Complaints"),
        backgroundColor: Colors.blue, // Set AppBar color
      ),
      body: Container(
        color: const Color(0xFFF2F2F2), // Set background color
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
                    "Complaint Information",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF023E8A)), // Dark blue title color
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _complaintTitleController,
                    decoration: InputDecoration(
                      labelText: "Complaint Title",
                      border: OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Label color
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter complaint title";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _complaintDetailsController,
                    decoration: InputDecoration(
                      labelText: "Complaint Details",
                      border: OutlineInputBorder(),
                      labelStyle: const TextStyle(
                          color: Color(0xFF023E8A)), // Label color
                    ),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter complaint details";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Complaint Submitted")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Set button background color
                      foregroundColor: Colors.white, // Set button text color
                    ),
                    child: const Text("Submit Complaint"),
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
