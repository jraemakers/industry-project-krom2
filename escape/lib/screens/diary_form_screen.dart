import 'package:escape/custom_widgets/diary_input_field.dart';
import 'package:escape/custom_widgets/trigger_button.dart';
import 'package:escape/models/SensoryOverloadDiary.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MyForm extends StatefulWidget {
  @override
  DiaryForm createState() => DiaryForm();
}

class DiaryForm extends State<MyForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _diaryController = TextEditingController();
  String trigger = 'None';

  late SharedPreferences _prefs;
  List<SenosoryOverloadDiary> _SensoryOverloadList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    String? eventListJson = _prefs.getString('eventList');
    if (eventListJson != null) {
      Iterable list = json.decode(eventListJson);
      setState(() {
        _SensoryOverloadList =
            list.map((model) => SenosoryOverloadDiary.fromJson(model)).toList();
      });
    }
  }

  Future<void> _saveData() async {
    await _prefs.setString('eventList',
        json.encode(_SensoryOverloadList.map((e) => e.toJson()).toList()));
  }

  void _handleSubmit() {
    SenosoryOverloadDiary newSensoryOverload = SenosoryOverloadDiary(
      title: _titleController.text,
      trigger: trigger,
      date:
          '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
      duration: int.tryParse(_durationController.text) ?? 0,
      diaryNote: _diaryController.text,
    );

    setState(() {
      _SensoryOverloadList.add(newSensoryOverload);
      _titleController.clear();
      _durationController.clear();
      _diaryController.clear();
    });
    _saveData();
  }

  void _handleSightSubmit(String newTrigger) {
    setState(() {
      trigger = newTrigger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //FIXME: use form widget
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            DiaryInputField(
              label: 'Title',
              controller: _titleController,
              //TODO: define controller field
            ),
            SizedBox(height: 20.0),
            Text(
              'Triggers',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //FIXME: think of switch statement for better outcome
                  trigger_button(
                    onPressed: () => _handleSightSubmit('Sight'),
                    buttonText: 'Sight',
                    icon: Icons.visibility,
                  ),
                  trigger_button(
                    onPressed: () => _handleSightSubmit('Sound'),
                    buttonText: 'Sound',
                    icon: Icons.hearing,
                  ),
                  trigger_button(
                    onPressed: () => _handleSightSubmit('Touch'),
                    buttonText: 'Touch',
                    icon: Icons.back_hand,
                  ),
                  trigger_button(
                    onPressed: () => _handleSightSubmit('Taste'),
                    buttonText: 'Taste',
                    icon: Icons.face,
                  ),
                  trigger_button(
                    onPressed: () => _handleSightSubmit('Smell'),
                    buttonText: 'Smell',
                    icon: Icons.face,
                  ),

                  trigger_button(
                    onPressed: () => _handleSightSubmit('Other'),
                    buttonText: 'Other',
                    textColor: Color.fromARGB(255, 242, 242, 242),
                    buttonColor: Color.fromARGB(255, 201, 201, 201),
                    icon: Icons.edit,
                  ),

                  //FIXME: create custom input fiels
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            SizedBox(height: 20.0),
            //FIXME: update this input
            DiaryInputField(
              label: 'Duration',
              controller: _durationController,

              //TODO: add drop down list(minutes, hours, days, weeks)
            ),

            SizedBox(height: 20.0),

            DiaryInputField(
              label: 'How do you feel?',
              maxLines: 4,
              controller: _diaryController,
            ),
//BUG: current date is not correct
            SizedBox(height: 70.0),
            Center(
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 134, 177, 230)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  onPressed: _handleSubmit,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
