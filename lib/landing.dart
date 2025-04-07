import 'package:assessment_mobile_app_project/home.dart';
import 'package:assessment_mobile_app_project/iot_monitoring.dart';
import 'package:assessment_mobile_app_project/profile.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0F0C0), // Light green background color
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Greenhouse Monitoring App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Use Navigator.pushAndRemoveUntil to remove all previous routes and push HomePage
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green, // Match AppBar background color
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
                'Creator\'s Profile',
                style: TextStyle(color: Colors.green), // Text matches AppBar
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutMePage()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'IoT Monitoring Data',
                style: TextStyle(color: Colors.green), // Text matches AppBar
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://solarimpulse.com/files/solutionrewrites/header_image/1981-03-16-000000/headerimageSmartGreenhouse.jpg'), // Replace with your image URL
                ),
                const SizedBox(height: 20),
                const Text(
                  'Project Background',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333), // Dark Gray text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Traditional farming methods often lead to inefficiencies in irrigation, soil management, and fertilizer usage. Many farmers rely on manual observation to determine when to water their crops or apply fertilizers, which can result in overwatering, nutrient imbalances, and unnecessary resource wastage. These issues not only reduce crop yield but also degrade soil health over time, making long-term farming unsustainable. To address these problems, this project introduces an IoT-based precision farming system designed to monitor soil conditions and automate irrigation based on real-time data.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333), // Dark Gray text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'This system integrates various sensors to collect environmental and soil-related data, allowing farmers to make better decisions. The soil moisture sensor helps detect the moisture levels in the soil, ensuring that irrigation is only activated when necessary, preventing water waste. A nutrient sensor measures the soil’s nutrient content, allowing farmers to manage fertilization more effectively and avoid overuse of chemicals that could harm the environment. Additionally, a temperature and humidity sensor monitors climatic conditions that affect soil moisture and plant growth. Together, these sensors provide real-time insights into soil and environmental conditions, making farming more data-driven and efficient.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333), // Dark Gray text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'The system processes the collected data and triggers automated irrigation when soil moisture levels drop below the required threshold. This ensures that crops receive the right amount of water at the right time, reducing human intervention while preventing both overwatering and drought stress. Farmers can access this data through a dashboard interface, enabling them to monitor their farm remotely and adjust settings as needed. Although the system is not fully automated, it provides smart support to farmers by optimizing irrigation and soil health management.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333), // Dark Gray text color
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'This project aligns with SDG 15: Life on Land, as it promotes sustainable land use and resource conservation. By utilizing IoT technology, the system enhances farming efficiency while reducing environmental impact. It aims to support farmers in improving productivity, maintaining healthier soil, and minimizing resource wastage. Through this approach, the project contributes to the advancement of technology-driven, sustainable agriculture, ensuring that farming practices remain efficient and environmentally responsible in the long run.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF333333), // Dark Gray text color
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