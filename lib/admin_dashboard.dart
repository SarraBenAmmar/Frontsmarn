import 'package:flutter/material.dart';
import 'package:smarn/manage_complaints_form.dart';
import 'package:smarn/manage_students_form.dart';
import 'package:smarn/manage_subjects_form.dart';
import 'package:smarn/manage_teachers_form.dart';
import 'package:smarn/manage_timetables_form.dart';
import 'package:smarn/space_constraints_form.dart';
import 'package:smarn/time_constraints_form.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), // Light grey background
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blue, // Main blue color for AppBar
        elevation: 4, // Slight elevation for shadow effect
      ),
      body: Row(
        children: [
          // Sidebar with darker color for contrast
          Container(
            width: 200,
            decoration: const BoxDecoration(
              color: Color(0xFF023E8A), // Dark blue sidebar
              boxShadow: [
                BoxShadow(blurRadius: 10, color: Colors.black12)
              ], // Shadow for depth
            ),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                _buildSidebarItem(context, Icons.person_outline,
                    'Manage Teachers', const ManageTeachersForm()),
                _buildSidebarItem(context, Icons.schedule, 'Manage Timetables',
                    const ManageTimetablesForm()),
                _buildSidebarItem(context, Icons.report_problem_outlined,
                    'Manage Complaints', const ManageComplaintsForm()),
              ],
            ),
          ),
          // Main Content with card animations
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildAnimatedDashboardCard(context, 'Manage Students',
                      Icons.group, const ManageStudentsForm()),
                  _buildAnimatedDashboardCard(context, 'Manage Subjects',
                      Icons.book_outlined, const ManageSubjectsForm()),
                  _buildAnimatedDashboardCard(context, 'Time Constraints',
                      Icons.timer_outlined, const TimeConstraintsForm()),
                  _buildAnimatedDashboardCard(context, 'Space Constraints',
                      Icons.location_on_outlined, const SpaceConstraintsForm()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sidebar item with hover effect and icon
  Widget _buildSidebarItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.white, size: 24),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        tileColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => page), // Navigate to the specified page
          );
        },
        hoverColor: Colors.white24,
      ),
    );
  }

  // Dashboard card with 3D effect, shadow, and hover animation
  Widget _buildAnimatedDashboardCard(
      BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => page)); // Navigate to the specified page
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 5), // Creates 3D-like shadow
            ),
          ],
        ),
        child: InkWell(
          splashColor: Colors.blue.withOpacity(0.3), // Splash effect
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.blue),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF023E8A), // Same as sidebar for uniformity
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
