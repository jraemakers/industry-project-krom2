import 'package:escape/custom_widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new_plan_screen.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  void _incrementMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
    });
  }

  void _decrementMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat('MMMM yyyy').format(_selectedDate);
    List<String> weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    List<DateTime> daysInMonth = List.generate(
      DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day,
      (index) => DateTime(_selectedDate.year, _selectedDate.month, index + 1),
    );

    return Scaffold(
      backgroundColor: Color(0xFF00567F), // Background color
      appBar: AppBar(
        backgroundColor: Color(0xFF00567F),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.transparent),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewPlanScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: _decrementMonth,
                      ),
                      Text(
                        monthYear,
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: _incrementMonth,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: weekdays.map((day) {
                      return Column(
                        children: [
                          Text(
                            day,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 4),
                        ],
                      );
                    }).toList(),
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 4.0,
                    runSpacing: 4.0,
                    children: daysInMonth.map((day) {
                      return Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: day.day == DateTime.now().day && day.month == DateTime.now().month ? Colors.white : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: day.day == DateTime.now().day && day.month == DateTime.now().month ? Colors.black : Colors.white,
                            fontWeight: day.day == DateTime.now().day && day.month == DateTime.now().month ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today’s plan',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Color(0xFFFFA726), fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                    TaskCard(title: 'Groceries', time: '10:00', isCompleted: true),
                    TaskCard(title: 'Gym', time: '12:00', isCompleted: false),
                    TaskCard(title: 'Nightclub', time: '23:00', isCompleted: true),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day’s Note 24/05',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'No notes was taken !',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Adjust the height here if needed
            Spacer(),
            // BottomNavigationBar(
            //   backgroundColor: Color(0xFF00567F),
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home, color: Colors.white),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.calendar_today, color: Colors.white),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.add_box, color: Colors.white),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.notifications, color: Colors.white),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.person, color: Colors.white),
            //       label: '',
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
