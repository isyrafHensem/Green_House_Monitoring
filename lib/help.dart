import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final DatabaseReference helpRTDB = FirebaseDatabase.instanceFor(
  app: Firebase.app(),
  databaseURL: "https://project-nodered-53287-default-rtdb.firebaseio.com",
).ref();

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool isSubmitting = false;

  void sendHelpRequest() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isSubmitting = true;
      });

      try {
        await helpRTDB.child('HelpRequests').push().set({
          'title': _titleController.text,
          'description': _descriptionController.text,
          'timestamp': DateTime.now().toIso8601String(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Help request submitted successfully!')),
        );
        _titleController.clear();
        _descriptionController.clear();
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit request: $error')),
        );
      } finally {
        setState(() {
          isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF), // Light Blue background color
      appBar: AppBar(
        title: const Text(
          'Help & Support',
          style: TextStyle(color: Colors.white), // AppBar title text color
        ),
        iconTheme: const IconThemeData(color: Colors.white), // AppBar icon theme color
        backgroundColor: const Color(0xFF89CFF0), // AppBar background color
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFADD8E6), Color(0xFF89CFF0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildDrawerItem('Home', '/LandingPage'),
            _buildDrawerItem('Creator\'s Profile', '/AboutMePage'),
            _buildDrawerItem('IoT Monitoring Data', '/IotMonitoringDataPage'),
            _buildDrawerItem('IoT Controlling', '/IotControllingPage'),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Submit Your Issue',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF89CFF0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _titleController,
                              style: const TextStyle(color: Color(0xFFB0B0B0)), // Light gray text
                              decoration: InputDecoration(
                                labelText: 'Title',
                                labelStyle: const TextStyle(color: Color(0xFFB0B0B0)), // Light gray label
                                hintText: 'Enter the title',
                                hintStyle: const TextStyle(color: Color(0xFFB0B0B0)), // Light gray hint
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF89CFF0)),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a title';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _descriptionController,
                              style: const TextStyle(color: Color(0xFFB0B0B0)), // Light gray text
                              decoration: InputDecoration(
                                labelText: 'Description',
                                labelStyle: const TextStyle(color: Color(0xFFB0B0B0)), // Light gray label
                                hintText: 'Describe your issue',
                                hintStyle: const TextStyle(color: Color(0xFFB0B0B0)), // Light gray hint
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF89CFF0)),
                                ),
                              ),
                              maxLines: 5,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a description';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: isSubmitting ? null : sendHelpRequest,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF89CFF0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: isSubmitting
                                  ? const CircularProgressIndicator(
                                valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                                  : const Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, String routeName) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF89CFF0)),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, routeName);
      },
    );
  }
}