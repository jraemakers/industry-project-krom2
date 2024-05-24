import 'package:escape/screens/diary_form_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 120),
          width: 100,
          height: 50,
          child: const Center(
              //FIXME: change it to Appropriate logo icon
              child: Text('OFF', style: TextStyle(color: Colors.white))),
        ),
        backgroundColor: Color.fromARGB(255, 19, 16, 40),
      ),
      body: DiaryForm(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
        //TODO: Connect the navigation to the screens
        //TODO: define and customise event outputs
      ),
    );
  }
}
