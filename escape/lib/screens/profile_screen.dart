import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final Size screenSize = MediaQuery.of(context).size;

    // Calculate the center position of the circle
    final double circleLeft = (screenSize.width - 400) / 2; // Adjust 400 to your desired width
    final double circleTop = 10; // Adjust the top position as needed

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
          // White Circle
          Positioned(
            top: circleTop,
            left: circleLeft,
            child: Container(
              width: 400, // Set circle width
              height: 500, // Set circle height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF005174), // Set circle color to white
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 150), // Adjust the top padding as needed
                  child: Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}















  






