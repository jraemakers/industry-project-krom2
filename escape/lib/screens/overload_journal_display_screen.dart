import 'package:escape/models/SensoryOverloadDiary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class OverloadJournalDisplay extends StatefulWidget {
  final SenosoryOverloadDiary diary;

  OverloadJournalDisplay({required this.diary});

  @override
  _OverloadJournalDisplayState createState() => _OverloadJournalDisplayState();
}

class _OverloadJournalDisplayState extends State<OverloadJournalDisplay> {
  final FlutterTts flutterTts = FlutterTts();
  bool speakerState = false;
  bool _showTriggerButtonState = false;
  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  stopSpeaking() {
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 81, 116, 1.0),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15),
              child: GestureDetector(
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
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                '${widget.diary.title}',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 500,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(80, 153, 185, 0.33),
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              '${widget.diary.date.substring(0, 16)}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: '${widget.diary.diaryNote}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                        _showTriggerButtonState
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widget.diary.triggers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(
                                      'Title: ${widget.diary.triggers[index]}',
                                    ),
                                  );
                                },
                              )
                            : SizedBox(),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Row(
                            children: [
                              Text(speakerState ? 'On' : 'Off',
                                  style: TextStyle(color: Colors.white)),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 100, 143, 182),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      speakerState = !speakerState;
                                      if (speakerState) {
                                        speak(widget.diary.diaryNote);
                                      } else {
                                        stopSpeaking();
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    speakerState
                                        ? Icons.volume_up
                                        : Icons.volume_off_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //TODO: create resusable button wwidget for the submission buttons
                  Container(
                    width: 170,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(0, 81, 116, 1)),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(
                                  color: Color.fromRGBO(26, 174, 179, 1)),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Show Location',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Container(
                    width: 170,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(0, 81, 116, 1)),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              side: BorderSide(
                                  color: Color.fromRGBO(26, 174, 179, 1)),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _showTriggerButtonState = !_showTriggerButtonState;
                          });
                        },
                        child: Text(
                            _showTriggerButtonState
                                ? 'Hide Triggers'
                                : 'Show Triggers',
                            style: const TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
