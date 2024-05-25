import 'package:escape/custom_widgets/diary_input_field.dart';
import 'package:escape/custom_widgets/trigger_button.dart';
import 'package:escape/models/SensoryOverloadDiary.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  DiaryForm createState() => DiaryForm();
}

class DiaryForm extends State<MyForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _diaryController = TextEditingController();
  String trigger = 'None';

  String _plannedEvent = '';

  void _handleSubmit() {
    SenosoryOverloadDiary newEvent = SenosoryOverloadDiary(
      title: _titleController.text,
      trigger: trigger,
      date:
          '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}',
      duration: int.tryParse(_durationController.text) ?? 0,
      diaryNote: _diaryController.text,
    );

    setState(() {
      // _eventList.add(newEvent);
      _plannedEvent =
          'Title: ${newEvent.title} Trigger: ${newEvent.trigger} Date:  ${newEvent.date} Duration: ${newEvent.duration} Note: ${newEvent.diaryNote}';
      _titleController.clear();
      _durationController.clear();
      _diaryController.clear();
      print('$_plannedEvent');
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
              // style: TextStyle(color: Colors.white),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //FIXME: think of switch statement for better outcome
                  trigger_button(
                    onPressed: () {},
                    buttonText: 'Sight',
                    icon: Icons.visibility,
                  ),
                  trigger_button(
                    onPressed: () {},
                    buttonText: 'Sound',
                    icon: Icons.hearing,
                  ),
                  trigger_button(
                    onPressed: () {},
                    buttonText: 'Touch',
                    icon: Icons.back_hand,
                  ),
                  trigger_button(
                    onPressed: () {},
                    buttonText: 'Taste',
                    icon: Icons.face,
                  ),
                  trigger_button(
                    onPressed: () {},
                    buttonText: 'Smell',
                    icon: Icons.face,
                  ),

                  trigger_button(
                    onPressed: () {},
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
              //TODO: Define controller field
              //TODO: add drop down lint(minutes, hours, days, weeks)
            ),

            SizedBox(height: 20.0),

            DiaryInputField(
              label: 'How do you feel?',
              maxLines: 4,
              controller: _diaryController,
            ),

            //TODO: implement save button functionality
            Text('$_plannedEvent'),
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
                  //TODO: onPressed add form input to storage
                  //HACK: empty function
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
