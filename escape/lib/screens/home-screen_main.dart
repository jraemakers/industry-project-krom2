import 'package:flutter/material.dart';
import 'package:escape/screens/diary_form_screen.dart';
import 'package:escape/screens/diary_history_screen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  bool groceriesChecked = false;
  bool runningChecked = false;

  final List<Widget> _screens = [
    Home(),
    Container(
      child: Center(
        child: Text(
          'Calendar Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text('Profile Screen', style: TextStyle(fontSize: 40)),
      ),
    ),
    DiaryHistory(),
    Container(
      child: Center(
        child: Text('Settings Screen', style: TextStyle(fontSize: 40)),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005174),
      appBar: AppBar(
        backgroundColor: Color(0xFF005174),
        title: Center(
          child: Image.asset('assets/images/file.png', fit: BoxFit.cover, height: 50),
        ),
        actions: [
          Icon(Icons.wb_sunny, color: Colors.yellow, size: 30),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome John Doe !",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              SizedBox(width: 20),
                              ChecklistItem(
                                icon: Icons.umbrella,
                                label: "Umbrella",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Today Plans",
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
              Column(
                children: [
                  PlanCard(
                    title: "Groceries",
                    time: "10:00 AM",
                    notes: "Buy fresh vegetables and fruits.",
                    checklist: ["List", "Bags", "Cash"],
                    checked: groceriesChecked,
                    onChecked: (value) {
                      setState(() {
                        groceriesChecked = value!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  PlanCard(
                    title: "Running",
                    time: "11:00 AM",
                    notes: "Morning run in the park.",
                    checklist: ["Shoes", "Water bottle"],
                    checked: runningChecked,
                    onChecked: (value) {
                      setState(() {
                        runningChecked = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Reminders for Tomorrow",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              ReminderCard(
                title: "Reminder: Startumseind",
                description: "Going to Startum with friends",
              ),
              const SizedBox(height: 10),
              ReminderCard(
                title: "Reminder: Grocery List",
                description: "Shopping with Mom",
              ),
            ],
          ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF005174),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFFFEA655),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
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

class PlanCard extends StatelessWidget {
  final String title;
  final String time;
  final String notes;
  final List<String> checklist;
  final bool checked;
  final ValueChanged<bool?>? onChecked;

  const PlanCard({
    required this.title,
    required this.time,
    required this.notes,
    required this.checklist,
    required this.checked,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
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
                const SizedBox(height: 10),
                Text(
                  notes,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            value: checked,
            onChanged: onChecked,
            checkColor: Colors.white,
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  final String title;
  final String description;

  const ReminderCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.black),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
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
