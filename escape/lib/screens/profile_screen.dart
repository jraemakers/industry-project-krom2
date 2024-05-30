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
            top: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reminders for Tomorrow',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Adjust vertical spacing
                Container(
                  width: screenSize.width - 40, // Adjust width to fill the screen
                  padding: EdgeInsets.all(12), // Padding inside the container
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 5, 230, 255), // Background color of the rectangle
                    borderRadius: BorderRadius.circular(8), // Border radius
                  ),
                  child: Text(
                    'Example Reminder',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 16), // Add vertical spacing between containers
                Container(
                  width: screenSize.width - 40, // Adjust width to fill the screen
                  padding: EdgeInsets.all(12), // Padding inside the container
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 230, 145), // Background color of the rectangle
                    borderRadius: BorderRadius.circular(8), // Border radius
                  ),
                  child: Text(
                    'Another Example Reminder',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 16), // Add vertical spacing before the new text
                Padding(
                  padding: const EdgeInsets.only(top: 8.0), // Add padding to the top of the text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Activity History',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8), // Add vertical spacing before the new text
                      Text(
                        'What have you been up to lately?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16), // Add vertical spacing before the containers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (screenSize.width - 60) / 2, // Adjust width for two equal containers with some spacing
                            padding: EdgeInsets.all(12), // Padding inside the container
                            decoration: BoxDecoration(
                              color: Color(0xFF005174), // Background color of the container
                              borderRadius: BorderRadius.circular(8), // Border radius
                              border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 0.5), // Border color and width
                            ),
                            child: Column(
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
                                SizedBox(height: 4), // Add vertical spacing between texts
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
                          Container(
                            width: (screenSize.width - 60) / 2, // Adjust width for two equal containers with some spacing
                            padding: EdgeInsets.all(12), // Padding inside the container
                            decoration: BoxDecoration(
                              color: Color(0xFF005174), // Background color of the container
                              borderRadius: BorderRadius.circular(8), // Border radius
                              border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 0.5),
                               // Border color and width
                            ),
                            child: Column(
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
                                SizedBox(height: 4), // Add vertical spacing between texts
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



















  






