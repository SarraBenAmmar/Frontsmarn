import 'package:flutter/material.dart';
import 'package:smarn/manage_personnel_iformation_form.dart';
import 'package:smarn/manage_qualified_subjects_form.dart';
import 'package:smarn/view_complaints_or_print_timetable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("School Management System"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        // Set a background color or gradient
        color: const Color(0xFFF2F2F2), // Light grey background
        padding: const EdgeInsets.all(20.0), // Padding around the body
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              const Text(
                "Welcome to the School Management System",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF023E8A), // Dark blue color
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30), // Space between title and buttons

              // Manage Qualified Subjects Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ManageQualifiedSubjectsForm(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  backgroundColor: Colors.blue, // Button background color
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                child: const Text("Manage Qualified Subjects"),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Manage Personnel Information Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ManagePersonnelInformationForm(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                child: const Text("Manage Personnel Information"),
              ),
              const SizedBox(height: 20), // Space between buttons

              // View Complaints / Print Timetable Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ViewComplaintsOrPrintTimetable(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                child: const Text("View Complaints / Print Timetable"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
