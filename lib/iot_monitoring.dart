import 'package:assessment_mobile_app_project/landing.dart';
import 'package:assessment_mobile_app_project/profile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class IotMonitoringDataPage extends StatefulWidget {
  const IotMonitoringDataPage({super.key});

  @override
  State<IotMonitoringDataPage> createState() => _IotMonitoringDataPageState();
}

class _IotMonitoringDataPageState extends State<IotMonitoringDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IoT Monitoring Data',
          style: TextStyle(color: Color(0xFFFFCDD2)), // Match text color
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF8F07BA), // Background color
        iconTheme: IconThemeData(color: Color(0xFFFFCDD2)), // Change drawer icon color
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF8F07BA), // Match AppBar background
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color(0xFFFFCDD2), // Match AppBar text color
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Color(0xFF8F07BA)), // Text matches AppBar
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
                'Creator\'s Profile',
                style: TextStyle(color: Color(0xFF8F07BA)), // Text matches AppBar
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutMePage()),
                );
              },
            ),
          ],
        ),
      ),

      body: const IotMonitoring(), // Add the IotMonitoring widget here
    );
  }
}

final DatabaseReference myRTDB = FirebaseDatabase.instanceFor(
  app: Firebase.app(),
  databaseURL: "https://fire-auth-9044e-default-rtdb.asia-southeast1.firebasedatabase.app", // Replace with your database URL
).ref();

class IotMonitoring extends StatefulWidget {
  const IotMonitoring({super.key});

  @override
  State<IotMonitoring> createState() => _IotMonitoringState();
}

class _IotMonitoringState extends State<IotMonitoring> {
  String temperature = '0';
  String humidity = '0';
  String light = '0';
  String soilMoisture = '0';
  bool systemOn = false;
  bool irrigationOn = false;
  bool ledAutomation = false;
  bool relay1State = false;
  bool relay2State = false;

  void readSensorValues() {
    myRTDB.child('Sensor/tem').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        temperature = data.toString();
      });
      print('Temperature: $temperature'); // Debug statement
    });
    myRTDB.child('Sensor/hum').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        humidity = data.toString();
      });
      print('Humidity: $humidity'); // Debug statement
    });
    myRTDB.child('Sensor/light').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        light = data.toString();
      });
      print('Light: $light'); // Debug statement
    });
    myRTDB.child('Sensor/soil').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        soilMoisture = data.toString();
      });
      print('Soil Moisture: $soilMoisture'); // Debug statement
    });
    myRTDB.child('Control/system').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        systemOn = data.toString() == 'ON';
      });
      print('System On: $systemOn'); // Debug statement
    });
    myRTDB.child('Control/irrigation').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        irrigationOn = data.toString() == 'ON';
      });
      print('Irrigation On: $irrigationOn'); // Debug statement
    });
    myRTDB.child('Control/led').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        ledAutomation = data.toString() == 'ON';
      });
      print('LED Automation: $ledAutomation'); // Debug statement
    });
    myRTDB.child('Control/relay1').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        relay1State = data.toString() == 'ON';
      });
      print('Relay 1 State: $relay1State'); // Debug statement
    });
    myRTDB.child('Control/relay2').onValue.listen((event) {
      final Object? data = event.snapshot.value;
      setState(() {
        relay2State = data.toString() == 'ON';
      });
      print('Relay 2 State: $relay2State'); // Debug statement
    });
  }

  void toggleSystem(bool value) {
    myRTDB.child('Control/system').set(value ? 'ON' : 'OFF');
    print('Toggled System: ${value ? 'ON' : 'OFF'}'); // Debug statement
  }

  void toggleIrrigation(bool value) {
    myRTDB.child('Control/irrigation').set(value ? 'ON' : 'OFF');
    print('Toggled Irrigation: ${value ? 'ON' : 'OFF'}'); // Debug statement
  }

  void toggleLed(bool value) {
    myRTDB.child('Control/led').set(value ? 'ON' : 'OFF');
    print('Toggled LED: ${value ? 'ON' : 'OFF'}'); // Debug statement
  }

  void toggleRelay1(bool value) {
    myRTDB.child('Control/relay1').set(value ? 'ON' : 'OFF');
    print('Toggled Relay 1: ${value ? 'ON' : 'OFF'}'); // Debug statement
  }

  void toggleRelay2(bool value) {
    myRTDB.child('Control/relay2').set(value ? 'ON' : 'OFF');
    print('Toggled Relay 2: ${value ? 'ON' : 'OFF'}'); // Debug statement
  }

  @override
  void initState() {
    super.initState();
    readSensorValues();
  }

  Widget buildSensorCard(
      {required String title,
        required String value,
        required Color color,
        required String imageUrl}) {
    return Card(
      color: color,
      child: ListTile(
        leading: Image.network(imageUrl, width: 50, height: 50),
        title: Text(title, style: TextStyle(fontSize: 20, color: Colors.black)),
        subtitle: Text(value, style: TextStyle(fontSize: 20, color: Colors.black)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFE1BEE7), // Light purple background color
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                width: constraints.maxWidth * 0.85,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      buildSensorCard(
                        title: 'Temperature',
                        value: '$temperature °C',
                        color: Colors.red.shade100,
                        imageUrl: 'https://cdn4.iconfinder.com/data/icons/medical-red-1/512/thermometer-1024.png',
                      ),
                      buildSensorCard(
                        title: 'Humidity',
                        value: '$humidity %',
                        color: Colors.blue.shade100,
                        imageUrl: 'https://static.vecteezy.com/system/resources/previews/011/652/634/original/humidity-3d-render-icon-illustration-png.png',
                      ),
                      buildSensorCard(
                        title: 'Soil Moisture',
                        value: '$soilMoisture',
                        color: Colors.green.shade100,
                        imageUrl: 'https://creazilla-store.fra1.digitaloceanspaces.com/icons/3231672/soil-moisture-icon-md.png',
                      ),
                      buildSensorCard(
                        title: 'Light',
                        value: '$light lx',
                        color: Colors.yellow.shade100,
                        imageUrl: 'https://static.vecteezy.com/system/resources/previews/018/874/633/original/light-bulb-icon-line-transparent-background-png.png',
                      ),
                      SwitchListTile(
                        title: Text('System On', style: TextStyle(fontSize: 20, color: Colors.black)),
                        value: systemOn,
                        onChanged: toggleSystem,
                      ),
                      SwitchListTile(
                        title: Text('Irrigation', style: TextStyle(fontSize: 20, color: Colors.black)),
                        value: irrigationOn,
                        onChanged: toggleIrrigation,
                      ),
                      SwitchListTile(
                        title: Text('LED Automation', style: TextStyle(fontSize: 20, color: Colors.black)),
                        value: ledAutomation,
                        onChanged: toggleLed,
                      ),
                      SwitchListTile(
                        title: Text('Relay 1', style: TextStyle(fontSize: 20, color: Colors.black)),
                        value: relay1State,
                        onChanged: toggleRelay1,
                      ),
                      SwitchListTile(
                        title: Text('Relay 2', style: TextStyle(fontSize: 20, color: Colors.black)),
                        value: relay2State,
                        onChanged: toggleRelay2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: IotMonitoringDataPage(),
  ));
}