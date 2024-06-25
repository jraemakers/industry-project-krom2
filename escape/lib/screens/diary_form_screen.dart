import 'package:escape/custom_widgets/diary_input_field.dart';
import 'package:escape/custom_widgets/trigger_button.dart';
import 'package:escape/models/SensoryOverloadDiary.dart';
import 'package:escape/screens/home_screen.dart';
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

  List<String> _triggersList = [];

  late SharedPreferences _prefs;
  List<SenosoryOverloadDiary> _SensoryOverloadList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    String? triggerListJson = _prefs.getString('triggerList');
    if (triggerListJson != null) {
      Iterable list = json.decode(triggerListJson);
      setState(() {
        _SensoryOverloadList =
            list.map((model) => SenosoryOverloadDiary.fromJson(model)).toList();
      });
    }
  }

  Future<void> _saveData() async {
    await _prefs.setString('triggerList',
        json.encode(_SensoryOverloadList.map((e) => e.toJson()).toList()));
  }

  void _handleSubmit() {
    SenosoryOverloadDiary newSensoryOverload = SenosoryOverloadDiary(
      title: _titleController.text,
      triggers: _triggersList,
      // date:
      //     '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
      date:
          '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}:${DateTime.now().second.toString().padLeft(2, '0')}',

      duration: int.tryParse(_durationController.text) ?? 0,
      diaryNote: _diaryController.text,
    );

    setState(() {
      _SensoryOverloadList.add(newSensoryOverload);
      _titleController.clear();
      _durationController.clear();
      _diaryController.clear();
      // _triggersList.clear();
    });
    _saveData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

//FIXME: change the method name
  void _handleSightSubmit(String newTrigger) {
    setState(() {
      if (!_triggersList.contains(newTrigger)) {
        _triggersList.add(newTrigger);
      }
    });
  }

  void _removeTriggerInput(String triggerToRemove) {
    setState(() {
      _triggersList.remove(triggerToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF005174),
      body: Center(
        child: SingleChildScrollView(
          //FIXME: use form widget
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                const Text(
                  'Sensory Overload Journal',
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                DiaryInputField(
                  label: 'Title',
                  controller: _titleController,
                ),
                SizedBox(height: 20.0),

                Text(
                  'Triggers',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //FIXME: think of switch statement for better outcome
                            TriggerButton(
                              onPressed: () => _handleSightSubmit('Sight'),
                              buttonText: 'Sight',
                              icon: Icons.visibility,
                            ),
                            TriggerButton(
                              onPressed: () => _handleSightSubmit('Sound'),
                              buttonText: 'Sound',
                              icon: Icons.hearing,
                            ),
                            TriggerButton(
                              onPressed: () => _handleSightSubmit('Touch'),
                              buttonText: 'Touch',
                              icon: Icons.back_hand,
                            ),
                            TriggerButton(
                              onPressed: () => _handleSightSubmit('Taste'),
                              buttonText: 'Taste',
                              icon: Icons.face,
                            ),
                            TriggerButton(
                              onPressed: () => _handleSightSubmit('Smell'),
                              buttonText: 'Smell',
                              icon: Icons.face,
                            ),

                            TriggerButton(
                              onPressed: () => _handleSightSubmit('Other'),
                              buttonText: 'Other',
                              textColor: Color.fromARGB(255, 242, 242, 242),
                              buttonColor: Color.fromARGB(255, 127, 141, 146),
                              icon: Icons.edit,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _triggersList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _triggersList[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(width: 2.0),
                            GestureDetector(
                              onTap: () {
                                _removeTriggerInput(_triggersList[index]);
                              },
                              child: Icon(Icons.close,
                                  size: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                //FIXME: update this input
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DiaryInputField(
                        label: 'Duration',
                        controller: _durationController,

                        //TODO: add drop down list(minutes, hours, days, weeks)
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 50,
                      width: 150,
                      child: DropdownButtonFormField<String>(
                        value: 'Minutes',
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(26, 174, 179, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (String? newValue) {
                          //TODO:  Handle dropdown value input
                        },
                        dropdownColor: Color(0xFF0F6C95),
                        items: <String>['Minutes', 'Hours', 'Days']
                            .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),

                DiaryInputField(
                  label: 'How do you feel?',
                  maxLines: 4,
                  controller: _diaryController,
                ),

                SizedBox(height: 60.0),

                Center(
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(0, 81, 116, 1)),
                        elevation: MaterialStateProperty.all<double>(8.0),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            side: BorderSide(
                                color: Color.fromRGBO(26, 174, 179, 1)),
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
        ),
      ),
    );
  }
}
