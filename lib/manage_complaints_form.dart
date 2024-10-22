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
      appBar: AppBar(title: const Text("Manage Complaints")),
      body: Center(
        // Utilisation du widget Center pour centrer le contenu
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap:
                  true, // Permet de réduire la taille du ListView pour le centrer
              children: [
                const Text("Complaint Information",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _complaintTitleController,
                  decoration: const InputDecoration(
                    labelText: "Complaint Title",
                    border: OutlineInputBorder(),
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
                  decoration: const InputDecoration(
                    labelText: "Complaint Details",
                    border: OutlineInputBorder(),
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
                  child: const Text("Submit Complaint"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
