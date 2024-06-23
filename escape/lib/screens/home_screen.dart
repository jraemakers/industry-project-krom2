import 'package:escape/screens/diary_history_screen.dart';
import 'package:escape/screens/new_fix_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:escape/screens/calendar_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    FixHome(),
    CalendarScreen(),
    DiaryHistory(),
    Container(
      child: Center(
        child: Text(
          'Statistics Screen',
          style: TextStyle(fontSize: 40),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(fontSize: 40),
        ),
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
        title: Container(
          margin: EdgeInsets.only(left: 120),
          width: 120,
          height: 70,
          child: Center(
            child: Image.asset('assets/images/file.png', fit: BoxFit.cover),
          ),
        ),
        backgroundColor: Color(0xFF005174),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 2, 78, 110),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFFFEA655),
        selectedFontSize: 12,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'My day',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
