import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF005174), 
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: const Color.fromRGBO(8, 95, 133, 0.85),
              elevation: 0,
              title: Container(),
              toolbarHeight: 200,
            ),
          ),
          Positioned(
            top: 60,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 385,
                height: 400,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF005174),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Eindhoven',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reminders for Tomorrow',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: screenSize.width - 40,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 5, 230, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Example Reminder',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: screenSize.width - 40,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 16, 230, 145),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Another Example Reminder',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Activity History', 
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'What have you been up to lately?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenSize.width - 80) / 2,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF005174),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 0.5),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Activities: 7',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Visit Activities',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: (screenSize.width - 80) / 2,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF005174),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 0.5),
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Events: 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Visit Events',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF005174),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}
