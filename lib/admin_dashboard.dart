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
      backgroundColor: const Color(0xFF1C1C1E), // Flat black background
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFB414A4), // Couleur mauve pour l'AppBar
        elevation: 0, // Flat AppBar, no shadow
      ),
      body: Row(
        children: [
          // Sidebar with deep black and accent hover effect
          Container(
            width: 220,
            color: const Color(0xFF1A1A1D), // Solid black sidebar
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
          // Main Content area with Grid of animated cards
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

  // Sidebar item with mauve hover effect
  Widget _buildSidebarItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon,
            color: const Color(0xFFB414A4),
            size: 26), // Couleur mauve pour l'icône
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFB414A4), // Couleur mauve pour le texte
            fontSize: 16,
          ),
        ),
        tileColor: Colors.transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        hoverColor:
            const Color(0xFFB414A4).withOpacity(0.3), // Light hover effect
      ),
    );
  }

  // Animated card with subtle mauve hover effect
  Widget _buildAnimatedDashboardCard(
      BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFF2C2C2E), // Dark gray card
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          splashColor: const Color(0xFFB414A4), // Mauve splash effect
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,
                    size: 50, color: const Color(0xFFB414A4)), // Mauve icon
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text for better contrast
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
