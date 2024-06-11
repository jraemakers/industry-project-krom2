import 'package:escape/screens/overload_journal_display_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:escape/models/SensoryOverloadDiary.dart';
import 'package:intl/intl.dart';

class DiaryHistory extends StatefulWidget {
  @override
  _DiaryHistoryState createState() => _DiaryHistoryState();
}

class _DiaryHistoryState extends State<DiaryHistory> {
  late SharedPreferences _prefs;
  List<SenosoryOverloadDiary> _sensoryOverloadList = [];

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
        _sensoryOverloadList =
            list.map((model) => SenosoryOverloadDiary.fromJson(model)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 81, 116, 1.0),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            'Journal Log',
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(186, 33, 169, 227),
                                  ),
                                  padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.only(left: 10, right: 10)),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                ),
                                //TODO: Go to overview(Navigation)
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.insert_chart,
                                      color: Color.fromARGB(255, 237, 239, 241),
                                    ),
                                    Text(
                                      'Overview',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )),
                          ),
                          Icon(Icons.filter_list, color: Colors.white)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _sensoryOverloadList.length,
                itemBuilder: (BuildContext context, int index) {
                  var reversedList = _sensoryOverloadList.reversed.toList();
                  return
                      // Container(
                      Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 5.0),
                    child: ElevatedButton(
                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => OverloadJournalDisplay(
                      //             reversedList[index])),
                      //   );
                      // },
                      onPressed: () {
                        SenosoryOverloadDiary d = reversedList[index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OverloadJournalDisplay(diary: d),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(15, 108, 149, 0.5),
                        ),

                        //FIXME: Remove depricated features and find new way for MaterialStateProperty
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            // side: BorderSide(
                            //     color: Color.fromRGBO(26, 174, 179, 1)),
                            // side: MaterialStateProperty.all(BorderSide.none),
                          ),
                        ),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${reversedList[index].date.substring(8, 10)}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    '${getMonthNameFromString(reversedList[index].date)} '
                                    '${reversedList[index].date.substring(0, 4)}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${reversedList[index].title}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    reversedList[index].diaryNote.length > 20
                                        ? '${reversedList[index].diaryNote.substring(0, 19)}...'
                                        : reversedList[index].diaryNote,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.only(bottom: 60, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${reversedList[index].date.substring(11, 16)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String getMonthNameFromString(String dateString) {
  DateTime date = DateTime.parse(dateString);
  return DateFormat.MMMM().format(date);
}
