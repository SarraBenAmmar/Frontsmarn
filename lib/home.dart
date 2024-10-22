import 'package:flutter/material.dart';
import 'package:smarn/SelectionPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), // Light grey background
      appBar: AppBar(
        title: const Text('Smarn'),
        backgroundColor: Colors.blue, // Changed AppBar color to blue
      ),
      body: Column(
        children: [
          // Image section at the top
          Expanded(
            child: Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Image.asset(
                    'assets/img/i2.jpg', // Add a descriptive image related to the timetable generation
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay text describing the app
                const Positioned(
                  bottom: 40,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Smarn',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(198, 255, 255, 255),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Automate your timetable generation easily with Smarn, the administrative app that makes scheduling a breeze!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(198, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Login Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 40), // Increased padding for height and width
                backgroundColor: Colors.blue, // Changed button color to blue
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5, // Optional: adds a shadow effect
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectionPage(),
                  ),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24, // Increased font size for better visibility
                  color:
                      Colors.white, // Changed text color to white for contrast
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
