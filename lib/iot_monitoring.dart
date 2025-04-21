import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final DatabaseReference myRTDB = FirebaseDatabase.instanceFor(
  app: Firebase.app(),
  databaseURL: "https://project-nodered-53287-default-rtdb.firebaseio.com",
).ref();

class IotMonitoringDataPage extends StatefulWidget {
  const IotMonitoringDataPage({super.key});

  @override
  State<IotMonitoringDataPage> createState() => _IotMonitoringDataPageState();
}

class _IotMonitoringDataPageState extends State<IotMonitoringDataPage> {
  String temperature = '0';
  String humidity = '0';
  String light = '0';
  String soilMoisture = '0';

  void readSensorValues() {
    myRTDB.child('Sensor/tem').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        temperature = data.toString();
      });
    });
    myRTDB.child('Sensor/hum').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        humidity = data.toString();
      });
    });
    myRTDB.child('Sensor/light').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        light = data.toString();
      });
    });
    myRTDB.child('Sensor/soil').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        soilMoisture = data.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readSensorValues();
  }

  Widget buildSensorCard({
    required String title,
    required String value,
    required Color color,
    required String imageUrl,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: color,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.8),
            child: Image.network(imageUrl, width: 30, height: 30),
          ),
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1BEE7), // Background color of the body
      appBar: AppBar(
        title: const Text(
          'IoT Monitoring Data',
          style: TextStyle(color: Color(0xFFFFCDD2)), // AppBar title text color
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFFCDD2)), // AppBar icon theme color
        backgroundColor: const Color(0xFF8F07BA), // AppBar background color
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF8F07BA), // DrawerHeader background color
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xFFFFCDD2), // DrawerHeader text color
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Color(0xFF8F07BA)), // Drawer menu text color
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/LandingPage');
              },
            ),
            ListTile(
              title: const Text(
                'Creator\'s Profile',
                style: TextStyle(color: Color(0xFF8F07BA)), // Drawer menu text color
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/AboutMePage');
              },
            ),
            ListTile(
              title: const Text(
                'IoT Controlling',
                style: TextStyle(color: Color(0xFF8F07BA)), // Drawer menu text color
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/IotControllingPage');
              },
            ),
            ListTile(
              title: const Text(
                'Help & Support',
                style: TextStyle(color: Color(0xFF8F07BA)), // Drawer menu text color
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/help');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Page Header
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: const Color(0xFF8F07BA),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome to IoT Monitoring',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFCDD2),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'You can monitor real-time sensor data here.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFCDD2),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Sensor Cards
              Column(
                children: [
                  buildSensorCard(
                    title: 'Temperature',
                    value: '$temperature °C',
                    color: Colors.red.shade100, // Built-in shade for Temperature
                    imageUrl: 'https://cdn4.iconfinder.com/data/icons/medical-red-1/512/thermometer-1024.png',
                  ),
                  buildSensorCard(
                    title: 'Humidity',
                    value: '$humidity %',
                    color: Colors.blue.shade100, // Built-in shade for Humidity
                    imageUrl: 'https://static.vecteezy.com/system/resources/previews/011/652/634/original/humidity-3d-render-icon-illustration-png.png',
                  ),
                  buildSensorCard(
                    title: 'Soil Moisture',
                    value: '$soilMoisture %',
                    color: Colors.green.shade100, // Built-in shade for Soil Moisture
                    imageUrl: 'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3231672/soil-moisture-icon-md.png',
                  ),
                  buildSensorCard(
                    title: 'Light',
                    value: '$light lx',
                    color: Colors.yellow.shade100, // Built-in shade for Light
                    imageUrl: 'https://static.vecteezy.com/system/resources/previews/018/874/633/original/light-bulb-icon-line-transparent-background-png.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}