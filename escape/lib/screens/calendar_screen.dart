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
  List<Map<String, dynamic>> plans = [];

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

  void _addPlan(Map<String, dynamic> newPlan) {
    setState(() {
      plans.add(newPlan);
    });
  }

  void _deletePlan(int index) {
    setState(() {
      plans.removeAt(index);
    });
  }

  void _onDateTap(DateTime date) {
    // Logic for handling date tap, e.g., navigate to a detailed view
  }

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat('MMMM yyyy').format(_selectedDate);
    List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<DateTime> daysInMonth = List.generate(
      DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day,
      (index) => DateTime(_selectedDate.year, _selectedDate.month, index + 1),
    );
    DateTime today = DateTime.now();

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
            icon: Icon(Icons.add, color: Colors.white), // Set the plus icon color to white
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewPlanScreen()),
              );
              if (result != null) {
                _addPlan(result);
              }
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
                      bool isTodayWeekday = weekdays[today.weekday - 1] == day;
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: isTodayWeekday ? Color(0xFF00BFFF) : Colors.transparent, // Highlight color
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              day,
                              style: TextStyle(
                                color: isTodayWeekday ? Colors.white : Colors.white,
                                fontWeight: isTodayWeekday ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
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
                      bool isToday = day.day == today.day && day.month == today.month && day.year == today.year;
                      return GestureDetector(
                        onTap: () => _onDateTap(day),
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: isToday ? Border.all(color: Colors.white, width: 2) : null,
                            color: isToday ? Colors.white : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: isToday ? Colors.black : Colors.white,
                              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                            ),
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
                child: ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      title: plans[index]['title'],
                      time: plans[index]['time'],
                      date: plans[index]['date'],
                      note: plans[index]['note'],
                      location: plans[index]['location'],
                      checklist: List<Map<String, dynamic>>.from(plans[index]['checklist']),
                      isCompleted: plans[index]['checklist'].isNotEmpty &&
                          plans[index]['checklist'].every((item) => item['completed'] == true),
                      onDelete: () => _deletePlan(index),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
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
