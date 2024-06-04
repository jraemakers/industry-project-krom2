import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF005174),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------> Arrow Icon
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            // ---------------> Settings Text
            Padding(
              padding: const EdgeInsets.only(left: 26.0, top: 24.0, bottom: 24.0),
              child: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // ---------------> LightBlue Container
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  color: const Color(0xFF075D82),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                        child: const Text(
                          'GENERAL',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.account_circle, color: Colors.white),
                        ),
                        title: Text('Account', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.chevron_right, color: Colors.white),
                        onTap: () {
                        },
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.notifications, color: Colors.white),
                        ),
                        title: Text('Notifications', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.chevron_right, color: Colors.white),
                        onTap: () {
                        },
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.logout, color: Colors.white),
                        ),
                        title: Text('Logout', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.chevron_right, color: Colors.white),
                        onTap: () {
                        },
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        title: Text('Delete Account', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.chevron_right, color: Colors.white),
                        onTap: () {
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(
                          color: Colors.white54,
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 18.0),
                        child: const Text(
                          'FEEDBACK',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.bug_report, color: Colors.white),
                        ),
                        title: Text('Report a Bug', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.chevron_right, color: Colors.white),
                        onTap: () {
                        },
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.send, color: Colors.white),
                        ),
                        title: Text('Send Feedback', style: TextStyle(color: Colors.white)),
                        trailing: Icon(Icons.chevron_right, color: Colors.white),
                        onTap: () {
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingScreen(),
  ));
}

