import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/create-account': (context) => CreateAccountScreen(),
        '/home': (context) => const HomeScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/new-plan': (context) => const NewPlanScreen(),
        '/planning': (context) => const PlanningScreen(),
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF005174),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            // Logo and image section
            Column(
              children: [
                Image.asset(
                  'assets/logo.png', // Replace with your logo asset
                  height: 50,
                ),
                Image.asset(
                  'assets/illustration.png', // Replace with your illustration asset
                  height: 200,
                ),
              ],
            ),
            // Welcome text section
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Welcome To Off",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Plan with ease, track with confidence",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 20),
                  // Google sign-in button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: Image.asset('assets/google.png', height: 24),
                    label: const Text("Continue with Google"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "or Sign in with Email",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  // Email input
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Password input
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  // Remember me and forgot password section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                          ),
                          const Text("Remember Me"),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: const Text("Forgot Password?"),
                      ),
                    ],
                  ),
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 10),
                  // Sign up section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not registered yet?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/create-account');
                        },
                        child: const Text("Create an account"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF005174),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: const Color(0xFF005174),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Account.",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                suffixIcon: Icon(Icons.visibility, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              "Password must be at least 8 characters",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.white),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Sign up"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool emailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF005174),
      appBar: AppBar(
        backgroundColor: const Color(0xFF005174),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: emailSent
            ? Center(
                child: Text(
                  "We have sent you a link to your email.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Enter your email address and we will send you a link to reset your password.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          emailSent = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text("Send Email"),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF005174),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome Mo !",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Upcoming Plan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Meeting With Jan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "10:00 AM",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Checklist:",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ChecklistItem(
                        icon: Icons.laptop,
                        label: "Laptop",
                      ),
                      SizedBox(width: 20),
                      ChecklistItem(
                        icon: Icons.camera_alt,
                        label: "Camera",
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const ChecklistItem(
                    icon: Icons.umbrella,
                    label: "Umbrella",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Today Plans",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                PlanCard(
                  title: "Groceries",
                  time: "10:00 AM",
                  notes: "Buy fresh vegetables and fruits.",
                  checklist: ["List", "Bags", "Cash"],
                ),
                SizedBox(width: 10),
                PlanCard(
                  title: "Gym",
                  time: "12:00 PM",
                  notes: "Leg day workout.",
                  checklist: ["Gym clothes", "Water bottle", "Shoes"],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                PlanCard(
                  title: "Lunch",
                  time: "2:00 PM",
                  notes: "Lunch with Sarah at the new cafe.",
                  checklist: ["Reservation", "Wallet", "Phone"],
                ),
                SizedBox(width: 10),
                PlanCard(
                  title: "Meeting",
                  time: "4:00 PM",
                  notes: "Project update meeting with the team.",
                  checklist: ["Laptop", "Notes", "Pen"],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddDialog(),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Color(0xFF005174)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF005174),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Planning',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '', // Empty label for the center item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/planning');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class AddDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: const Color(0xFF005174),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75, // Adjust the width
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/new-plan');
                },
                child: const Text(
                  'New Plan',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(color: Colors.white),
              const Text(
                'New Trigger',
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String time;
  final String notes;
  final List<String> checklist;

  const PlanCard({
    required this.title,
    required this.time,
    required this.notes,
    required this.checklist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xFF005174),
                    title: Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time: $time",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Checklist:",
                          style: const TextStyle(color: Colors.white),
                        ),
                        ...checklist.map((item) => Text(
                              item,
                              style: const TextStyle(color: Colors.white70),
                            )),
                        const SizedBox(height: 10),
                        Text(
                          "Notes:",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          notes,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChecklistItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ChecklistItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class NewPlanScreen extends StatelessWidget {
  const NewPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF005174),
        elevation: 0,
        title: const Text("New Plan"),
      ),
      backgroundColor: const Color(0xFF005174),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Date",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon:
                          Icon(Icons.calendar_today, color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Time",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  dropdownColor: const Color(0xFF005174),
                  value: 'PM',
                  items: <String>['AM', 'PM'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Checklist",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                ChecklistButton(label: 'Laptop', icon: Icons.laptop),
                ChecklistButton(label: 'Camera', icon: Icons.camera_alt),
                ChecklistButton(label: 'Umbrella', icon: Icons.umbrella),
                ChecklistButton(label: 'Other', icon: Icons.add),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "How do you feel about this plan?",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                IconButton(
                  icon: Icon(Icons.mic, color: Colors.white),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: null,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.white),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChecklistButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const ChecklistButton({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  @override
  _PlanningScreenState createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  int selectedDateIndex = 4; // Default selected date index (Friday)

  // Example plans for different dates
  final Map<int, List<Map<String, dynamic>>> plans = {
    0: [
      {
        'title': 'Yoga',
        'time': '08:00 AM',
        'notes': 'Morning yoga session',
        'checklist': ['Mat', 'Water']
      },
      {
        'title': 'Work',
        'time': '09:00 AM',
        'notes': 'Work on project',
        'checklist': ['Laptop', 'Notebook']
      },
    ],
    1: [
      {
        'title': 'Running',
        'time': '07:00 AM',
        'notes': 'Morning run',
        'checklist': ['Shoes', 'Water bottle']
      },
      {
        'title': 'Meeting',
        'time': '10:00 AM',
        'notes': 'Team meeting',
        'checklist': ['Laptop', 'Agenda']
      },
    ],
    2: [
      {
        'title': 'Gym',
        'time': '06:00 AM',
        'notes': 'Gym session',
        'checklist': ['Gym clothes', 'Water bottle']
      },
      {
        'title': 'Lunch',
        'time': '01:00 PM',
        'notes': 'Lunch with friend',
        'checklist': ['Wallet', 'Phone']
      },
    ],
    3: [
      {
        'title': 'Study',
        'time': '10:00 AM',
        'notes': 'Study for exams',
        'checklist': ['Books', 'Notes']
      },
      {
        'title': 'Dinner',
        'time': '07:00 PM',
        'notes': 'Dinner with family',
        'checklist': ['Reservation', 'Wallet']
      },
    ],
    4: [
      {
        'title': 'Groceries',
        'time': '10:00 AM',
        'notes': 'Buy fresh vegetables and fruits',
        'checklist': ['List', 'Bags', 'Cash']
      },
      {
        'title': 'Gym',
        'time': '12:00 PM',
        'notes': 'Leg day workout',
        'checklist': ['Gym clothes', 'Water bottle', 'Shoes']
      },
      {
        'title': 'Lunch',
        'time': '02:00 PM',
        'notes': 'Lunch with Sarah at the new cafe',
        'checklist': ['Reservation', 'Wallet', 'Phone']
      },
      {
        'title': 'Nightclub',
        'time': '04:00 PM',
        'notes': 'Night out with friends',
        'checklist': ['ID', 'Cash', 'Phone']
      },
    ],
    5: [
      {
        'title': 'Hiking',
        'time': '09:00 AM',
        'notes': 'Hiking trip',
        'checklist': ['Shoes', 'Backpack']
      },
      {
        'title': 'Brunch',
        'time': '11:00 AM',
        'notes': 'Brunch with friend',
        'checklist': ['Wallet', 'Phone']
      },
    ],
    6: [
      {
        'title': 'Relax',
        'time': '10:00 AM',
        'notes': 'Relax at home',
        'checklist': ['Book', 'Tea']
      },
      {
        'title': 'Movie',
        'time': '07:00 PM',
        'notes': 'Watch a movie',
        'checklist': ['Snacks', 'Ticket']
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF005174),
        elevation: 0,
        title: const Text("Planning"),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color(0xFF005174),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(7, (index) {
                    final day = ['M', 'T', 'W', 'T', 'F', 'S', 'S'][index];
                    final date = (20 + index).toString();
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateIndex = index;
                        });
                      },
                      child: DateCard(
                          day: day,
                          date: date,
                          isSelected: selectedDateIndex == index),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome Mo !",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Lorem Lorem Lorem LoremLorem",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "My daily Insights",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: plans[selectedDateIndex]?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  final plan = plans[selectedDateIndex]![index];
                  return PlanCard(
                    title: plan['title'],
                    time: plan['time'],
                    notes: plan['notes'],
                    checklist: List<String>.from(plan['checklist']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddDialog(),
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Color(0xFF005174)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF005174),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Planning',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '', // Empty label for the center item
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/planning');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class DateCard extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const DateCard({
    required this.day,
    required this.date,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
