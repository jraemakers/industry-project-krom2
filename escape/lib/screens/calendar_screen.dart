import 'package:flutter/material.dart';
import 'package:escape/custom_widgets/task_card.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  void _incrementMonth() {
    setState(() {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month + 1,
        _selectedDate.day,
      );
    });
  }

  void _decrementMonth() {
    setState(() {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month - 1,
        _selectedDate.day,
      );
    });
  }

  List<String> _getWeekDays() {
    DateTime firstDayOfWeek = _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1));
    return List.generate(7, (index) {
      DateTime day = firstDayOfWeek.add(Duration(days: index));
      return "${day.day}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00567F), // Background color
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.transparent),
                    onPressed: () {},
                  ),
                  Text(
                    '9:41',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: _decrementMonth,
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward, color: Colors.white),
                            onPressed: _incrementMonth,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      return Column(
                        children: [
                          Text(
                            ['M', 'T', 'W', 'T', 'F', 'S', 'S'][index],
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            _getWeekDays()[index],
                            style: TextStyle(
                              color: index == 4 ? Colors.white : Colors.grey[400],
                              fontWeight: index == 4 ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      );
                    }),
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
                    TaskCard(title: 'Movie night', time: '01:00', isCompleted: true),
                    TaskCard(title: 'Sleep', time: '03:00', isCompleted: true),
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