import 'package:flutter/material.dart';
import 'package:smarn/manage_qualified_subjects_form.dart';
import 'package:smarn/manage_personnel_information_form.dart';
import 'package:smarn/view_complaints.dart';
import 'package:smarn/print_timetable.dart'; // Import PrintTimetable screen

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        backgroundColor: const Color(0xFFB414A4), // Purple AppBar color
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // Light background color
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            children: [
              const Text(
                "Welcome to the Student Dashboard",
                style: TextStyle(
                    fontSize: 20, color: Color(0xFF6A1B9A)), // Darker purple
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Button for Manage Qualified Subjects
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ManageQualifiedSubjectsForm()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFB414A4), // Purple button color
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 15), // Increased padding
                ),
                child: const Text("Manage Qualified Subjects"),
              ),
              const SizedBox(height: 20),

              // Button for Manage Personal Information
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ManagePersonnelInformationForm()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFB414A4), // Purple button color
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 15), // Increased padding
                ),
                child: const Text("Manage Personal Information"),
              ),
              const SizedBox(height: 20),

              // List options for View Complaints and Print Timetable
              const Text(
                "Other Options",
                style: TextStyle(
                    fontSize: 18, color: Color(0xFF6A1B9A)), // Darker purple
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),

              // View Complaints
              ListTile(
                title: const Text("View Complaints",
                    style: TextStyle(
                        color: Color(0xFF6A1B9A))), // Darker purple text
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ViewComplaints()),
                  );
                },
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xFF6A1B9A)), // Darker purple icon
              ),

              // Print Timetable
              ListTile(
                title: const Text("Print Timetable",
                    style: TextStyle(
                        color: Color(0xFF6A1B9A))), // Darker purple text
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PrintTimetable()), // Navigate to PrintTimetable
                  );
                },
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xFF6A1B9A)), // Darker purple icon
              ),
            ],
          ),
        ),
      ),
    );
  }
}
