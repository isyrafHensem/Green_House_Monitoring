import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final DatabaseReference myRTDB = FirebaseDatabase.instanceFor(
  app: Firebase.app(),
  databaseURL: "https://project-nodered-53287-default-rtdb.firebaseio.com",
).ref();

class IotControllingPage extends StatefulWidget {
  const IotControllingPage({super.key});

  @override
  State<IotControllingPage> createState() => _IotControllingPageState();
}

class _IotControllingPageState extends State<IotControllingPage> {
  bool systemOn = false;
  bool irrigationOn = false;
  bool ledAutomation = false;
  bool relay1State = false;
  bool relay2State = false;
  bool fanState = false;
  bool relay3State = false;

  void toggleSystem(bool value) {
    setState(() {
      systemOn = value;
    });
    myRTDB.child('Control/system').set(value ? 'sys1' : 'sys0');
  }

  void toggleIrrigation(bool value) {
    setState(() {
      irrigationOn = value;
    });
    myRTDB.child('Control/irrigation').set(value ? 'irr1' : 'irr0');
  }

  void toggleLed(bool value) {
    setState(() {
      ledAutomation = value;
    });
    myRTDB.child('Control/led').set(value ? 'led1' : 'led0');
  }

  void toggleRelay1(bool value) {
    setState(() {
      relay1State = value;
    });
    myRTDB.child('Control/relay1').set(value ? 'r1on' : 'r1off');
  }

  void toggleRelay2(bool value) {
    setState(() {
      relay2State = value;
    });
    myRTDB.child('Control/relay2').set(value ? 'r2on' : 'r2off');
  }

  void toggleFan(bool value) {
    setState(() {
      fanState = value;
    });
    myRTDB.child('Control/fan').set(value ? 'fan1' : 'fan0');
  }

  void toggleRelay3(bool value) {
    setState(() {
      relay3State = value;
    });
    myRTDB.child('Control/relay3').set(value ? 'r3on' : 'r3off');
  }

  Widget buildSwitchCard({
    required String title,
    required String description,
    required IconData icon,
    required bool value,
    required Function(bool) onChanged,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: color,
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
          'IoT Control Panel',
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
                'IoT Monitoring Data',
                style: TextStyle(color: Color(0xFF8F07BA)), // Drawer menu text color
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/IotMonitoringDataPage');
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
        child: Column(
          children: [
            buildSwitchCard(
              title: 'System On',
              description: 'Turn the entire system on or off.',
              icon: Icons.power_settings_new,
              value: systemOn,
              onChanged: toggleSystem,
              color: Colors.blueAccent,
            ),
            buildSwitchCard(
              title: 'Automate Irrigation',
              description: 'Enable or disable automated irrigation.',
              icon: Icons.water_drop,
              value: irrigationOn,
              onChanged: toggleIrrigation,
              color: Colors.green,
            ),
            buildSwitchCard(
              title: 'LED Automation',
              description: 'Control LED automation.',
              icon: Icons.lightbulb,
              value: ledAutomation,
              onChanged: toggleLed,
              color: Colors.amber,
            ),
            buildSwitchCard(
              title: 'Automate Airflow',
              description: 'Enable or disable automated airflow.',
              icon: Icons.air,
              value: fanState,
              onChanged: toggleFan,
              color: Colors.lightBlue,
            ),
            buildSwitchCard(
              title: 'Water Pump',
              description: 'Control the water pump.',
              icon: Icons.water,
              value: relay1State,
              onChanged: toggleRelay1,
              color: Colors.teal,
            ),
            buildSwitchCard(
              title: 'Lamp',
              description: 'Turn the lamp on or off.',
              icon: Icons.wb_incandescent,
              value: relay2State,
              onChanged: toggleRelay2,
              color: Colors.orangeAccent,
            ),
            buildSwitchCard(
              title: 'Fan',
              description: 'Control the fan.',
              icon: Icons.toys,
              value: relay3State,
              onChanged: toggleRelay3,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}