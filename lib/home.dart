import 'package:assessment_mobile_app_project/login.dart';
import 'package:assessment_mobile_app_project/signup.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduced padding for row alignment
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50), // Green theme color
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 10,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildFeatureCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.green.shade100,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green.shade300,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color(0xFF2E7D32), // Darker green for footer
      child: Column(
        children: const [
          Text(
            '© 2025 Greenhouse Monitoring App',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'All rights reserved.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F5E9), // Soft green background
      body: Stack(
        children: [
          // Background Layers
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFA5D6A7), // Light green at the top
                  const Color(0xFF4CAF50), // Vibrant green at the bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),
                // App Title
                const Text(
                  'Greenhouse Monitoring App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                // Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Monitor and control your greenhouse environment effectively.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Features Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildFeatureCard(
                        title: 'Real-Time Monitoring',
                        description: 'Track temperature, humidity, and soil moisture in real-time.',
                        icon: Icons.thermostat,
                      ),
                      buildFeatureCard(
                        title: 'Automated Controls',
                        description: 'Automate sprinklers, fans, and lighting systems.',
                        icon: Icons.auto_awesome,
                      ),
                      buildFeatureCard(
                        title: 'Detailed Analytics',
                        description: 'Get insights into your greenhouse performance.',
                        icon: Icons.analytics,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildButton(
                      text: 'Login',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                    ),
                    buildButton(
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Footer
                buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}