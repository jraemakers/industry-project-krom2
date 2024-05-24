import 'package:escape/custom_widgets/diary_input_field.dart';
import 'package:escape/custom_widgets/trigger_button.dart';
import 'package:flutter/material.dart';

class DiaryForm extends StatelessWidget {
  const DiaryForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //FIXME: use form widget
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sensory Overload Episode',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10),
            diary_input_field(
              label: 'Title',
              //TODO: define controller field
            ),
            SizedBox(height: 20.0),
            Text('Triggers'),
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
            //HACK: temprarly using text field for date input. Change it to a caledar date time picker
            TextField(
              //TODO: Define controller field
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            SizedBox(height: 20.0),
            //FIXME: update this input
            diary_input_field(
              label: 'Duration?',
              //TODO: Define controller field
              //TODO: add drop down lint(minutes, hours, days, weeks)
            ),

            SizedBox(height: 20.0),

            diary_input_field(
              label: 'How do you feel?',
              maxLines: 4,
            ),

            //TODO: implement save button functionality

            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 139, 185, 222)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                  //TODO: onPressed add form input to storage
                  //HACK: empty function
                  onPressed: () {},
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
