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
  List<SenosoryOverloadDiary> _filteredSensoryOverloadList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(() {
      _filter(_searchController.text);
    });
  }

  Future<void> _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    String? triggerListJson = _prefs.getString('triggerList');
    if (triggerListJson != null) {
      Iterable list = json.decode(triggerListJson);
      setState(() {
        _sensoryOverloadList =
            list.map((model) => SenosoryOverloadDiary.fromJson(model)).toList();
        _filteredSensoryOverloadList = _sensoryOverloadList;
      });
    }
  }

  void _filter(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredSensoryOverloadList = _sensoryOverloadList;
      } else {
        _filteredSensoryOverloadList = _sensoryOverloadList
            .where((item) =>
                item.title.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 81, 116, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'Journal Log',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 26,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(80, 153, 185, 0.33)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                              ),
                              filled: true,
                              fillColor: Color.fromRGBO(0, 81, 116, 1),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 185, 180, 180),
                                fontWeight: FontWeight.w100,
                                fontSize: 18,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0)),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.filter_list,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          //TODO: Add the button when needed

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _filteredSensoryOverloadList.length,
              itemBuilder: (BuildContext context, int index) {
                var reversedList =
                    _filteredSensoryOverloadList.reversed.toList();
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 5.0),
                  child: ElevatedButton(
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
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
