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
    );
  }
}
