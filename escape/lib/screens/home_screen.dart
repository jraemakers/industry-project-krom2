import 'package:escape/screens/diary_form_screen.dart';
import 'package:escape/screens/diary_history_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MyForm(),
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
      backgroundColor: Color.fromARGB(255, 233, 232, 231),
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 120),
          width: 100,
          height: 50,
          child: const Center(
            child: Text('OFF', style: TextStyle(color: Colors.white)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 78, 110, 191),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 78, 110, 191),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
