import 'package:flutter/material.dart';

class PrintTimetable extends StatelessWidget {
  const PrintTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Print Timetable"),
        backgroundColor: const Color(0xFFB414A4), // Purple AppBar
      ),
      body: Container(
        color: const Color(0xFFEDE7F6), // Light purple background
        child: Center(
          // Center widget to center content vertically and horizontally
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your Timetable:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF6A1B9A), // Darker purple text
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Sample timetable, replace with actual timetable data
                Expanded(
                  child: ListView(
                    shrinkWrap: true, // Adjust the ListView size
                    children: [
                      ListTile(
                        title:
                            const Text("Monday: Math - 10:00 AM to 11:30 AM"),
                        leading: const Icon(Icons.schedule, color: Colors.blue),
                      ),
                      ListTile(
                        title:
                            const Text("Tuesday: English - 1:00 PM to 2:30 PM"),
                        leading: const Icon(Icons.schedule, color: Colors.blue),
                      ),
                      ListTile(
                        title: const Text(
                            "Wednesday: Physics - 3:00 PM to 4:30 PM"),
                        leading: const Icon(Icons.schedule, color: Colors.blue),
                      ),
                      // Add more ListTile widgets for additional days/subjects
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Implement print functionality here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Printing timetable...")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB414A4), // Purple button
                    foregroundColor: Colors.white, // White text
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 30,
                    ),
                  ),
                  child: const Text("Print Timetable"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
