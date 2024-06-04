import 'package:escape/screens/diary_form_screen.dart';
import 'package:escape/screens/diary_history_screen.dart';
import 'package:escape/screens/home_temp.dart';
import 'package:escape/screens/overload_journal_display_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    TempHome(),
    Container(
        child: Center(
            child: Text(
      'Calendar Screen',
      style: TextStyle(fontSize: 40),
    ))),
    Container(
        child: Center(
            child: Text('Profile Screen', style: TextStyle(fontSize: 40)))),
    DiaryHistory(),
    Container(
        child: Center(
            child: Text('Settings Screen', style: TextStyle(fontSize: 40)))),
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
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
