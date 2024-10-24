import 'package:flutter/material.dart';

class ViewComplaints extends StatelessWidget {
  const ViewComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Complaints"),
        backgroundColor: const Color(0xFFB414A4), // Purple AppBar
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // Light purple background
        child: Center(
          // Add Center to vertically center the content
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding around the text
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              children: [
                const Text(
                  "List of Complaints:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6A1B9A), // Darker purple text
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Sample complaint list, replace with actual complaint data
                Expanded(
                  child: ListView(
                    shrinkWrap: true, // Adjust ListView size
                    children: [
                      ListTile(
                        title: const Text("Complaint 1"),
                        subtitle: const Text("Details of complaint 1"),
                        leading: const Icon(Icons.warning, color: Colors.red),
                      ),
                      ListTile(
                        title: const Text("Complaint 2"),
                        subtitle: const Text("Details of complaint 2"),
                        leading: const Icon(Icons.warning, color: Colors.red),
                      ),
                      // Add more ListTile widgets for additional complaints
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
