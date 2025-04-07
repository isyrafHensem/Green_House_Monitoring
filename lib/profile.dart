import 'package:assessment_mobile_app_project/iot_monitoring.dart';
import 'package:assessment_mobile_app_project/landing.dart';
import 'package:flutter/material.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF9C4),
      appBar: AppBar(
        title: const Text(
          'About Me',
          style: TextStyle(color: Color(0xFF333333)), // Dark Gray text color
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFCC7722), // Ochre background color
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFCC7722), // Match AppBar background color
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xFF333333), // Dark Gray text color
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Color(0xFFCC7722)), // Text matches AppBar
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'IoT Monitoring',
                style: TextStyle(color: Color(0xFFCC7722)), // Text matches AppBar
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IotMonitoringDataPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/isyrafgmbr.jpg'), // Corrected image path
                ),
                const SizedBox(height: 20),
                const Text(
                  'My name is Isyraf Darwisy, and I am a Semester 4A student with a passion for technology and innovation. I built this project to help make farming more efficient while also improving soil health. In traditional farming, many challenges arise due to overuse of chemical fertilizers and inefficient irrigation, which can degrade soil quality, waste resources, and harm the environment. Excessive fertilizer use, for example, can lead to soil acidification, while poor irrigation management can cause water wastage and erosion. Seeing these issues, I wanted to develop a technology-driven approach to help farmers manage their land more effectively.\n\n'
                      'This project takes inspiration from modern precision farming techniques and supports SDG 15: Life on Land, which focuses on sustainable land use and ecosystem conservation. By integrating IoT-based sensors, my system monitors soil conditions and automates irrigation based on real-time data. This helps farmers optimize water usage and maintain healthier soil without relying solely on traditional methods. While the system is not fully automated, it provides valuable data insights that allow for better decision-making in farming.\n\n'
                      'My mission is to use technology as a tool to support sustainable agriculture, making it easier for farmers to improve efficiency while reducing environmental impact. My vision is to develop practical, accessible solutions that assist farmers in optimizing their work, minimizing waste, and ensuring long-term soil health.\n\n'
                      'Since childhood, I have been fascinated by science and engineering, always eager to learn how things work. Over time, I realized the potential of technology in solving real-world problems, especially in agriculture, where even small innovations can create significant improvements. With this project, I hope to take a step toward smarter, more sustainable farming practices and encourage more people to explore the role of IoT in agriculture.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333), // Dark Gray text color
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