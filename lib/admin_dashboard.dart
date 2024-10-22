import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: const Color.fromARGB(255, 83, 202, 228),
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 180,
            color: const Color.fromARGB(255, 172, 172, 172),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                ListTile(
                  title: const Text('Manage Teachers'),
                  onTap: () {
                    // Add navigation or action here
                  },
                ),
                ListTile(
                  title: const Text('Manage Timetables'),
                  onTap: () {
                    // Add navigation or action here
                  },
                ),
                ListTile(
                  title: const Text('Manage Complaints'),
                  onTap: () {
                    // Add navigation or action here
                  },
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildDashboardButton('Manage Students'),
                  _buildDashboardButton('Manage Subjects'),
                  _buildDashboardButton('Manage Time Constraints'),
                  _buildDashboardButton('Manage Space Constraints'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardButton(String title) {
    return ElevatedButton(
      onPressed: () {
        // Add functionality for each button
      },
      child: Text(title, style: const TextStyle(fontSize: 18)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
