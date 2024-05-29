import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    // Calculate the center position of the circle
    final double circleLeft = (screenSize.width - 400) / 2; // Adjust 400 to your desired width

    return Scaffold(
      backgroundColor: Color(0xFF005174), // Set background color to #005174
      body: Stack(
        children: [
          // App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Color.fromRGBO(8, 95, 133, 0.85), // Set banner color to #085F85 with 85% opacity
              elevation: 0, // Remove the shadow
              title: Container(), // Empty container to remove the title
              // Adjust the height of the app bar
              toolbarHeight: 200, // Adjust the height as needed
            ),
          ),
          // White Circle 1 (above "John Doe" text)
          Positioned(
            top: 60, // Adjust the top position to position the circle above the app bar
            left: circleLeft,
            child: Container(
              width: 400, // Set circle width
              height: 400, // Set circle height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF005174), // Set circle color to white
              ),
            ),
          ),
          // pfp pfp
          Positioned(
            top: 30, // Adjust the top position to position the circle above the app bar
            left: 140,
            child: Container(
              width: 80, // Set circle width
              height: 80, // Set circle height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Set circle color to white
              ),
            ),
          ),
          // "John Doe" Text
          Positioned(
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
                  SizedBox(height: 1), // Add some space between the texts
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 5), // Adjust spacing as needed
                        Text(
                          'Eindhoven',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Additional Text
          Positioned(
            left: 20,
            top: 220,
            child: Text(
              'Reminders for Tomorrow',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
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

















  






