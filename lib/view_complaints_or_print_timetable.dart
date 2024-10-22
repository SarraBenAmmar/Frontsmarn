import 'package:flutter/material.dart';

class ViewComplaintsOrPrintTimetable extends StatelessWidget {
  const ViewComplaintsOrPrintTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Complaints / Print Timetable"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: const Color(0xFFF2F2F2),
        child: Center(
          child: const Text(
            "This section will allow you to view complaints or print timetables.",
            style: TextStyle(fontSize: 20, color: Color(0xFF023E8A)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
