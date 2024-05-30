import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:escape/models/SensoryOverloadDiary.dart';

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
    String? eventListJson = _prefs.getString('eventList');
    if (eventListJson != null) {
      Iterable list = json.decode(eventListJson);
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
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 10),
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Journal Log',
                            style: TextStyle(fontSize: 18, color: Colors.white),
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
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(15, 108, 149, 0.5),
                      borderRadius: BorderRadius.circular(10.0),
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
                                '${_sensoryOverloadList[index].date.substring(8, 10)}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                  '${_sensoryOverloadList[index].date.substring(0, 7)}',
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
                                '10:45',
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
