import 'package:flutter/material.dart';
import 'package:smarn/admin_dashboard.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AdminForm(),
      routes: {
        '/dashboard': (context) => const AdminDashboard(),
      },
    );
  }
}

class AdminForm extends StatefulWidget {
  const AdminForm({super.key});

  @override
  _AdminFormState createState() => _AdminFormState();
}

class _AdminFormState extends State<AdminForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Fond noir
      appBar: AppBar(
        title: const Text('Admin Form', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFB414A4), // Couleur mauve de l'AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E), // Couleur de fond de la carte
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Texte en blanc
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          color: Color(0xFFB414A4)), // Couleur mauve du label
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xFFB414A4)), // Bordure mauve lors du focus
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Color(0xFFB414A4)), // Couleur mauve du label
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(
                                0xFFB414A4)), // Bordure mauve lors du focus
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_usernameController.text == 'admin' &&
                            _passwordController.text == 'admin') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminDashboard()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid credentials')),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFFB414A4), // Couleur mauve du bouton
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white, // Couleur du texte du bouton
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
