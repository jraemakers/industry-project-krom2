import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiaryHistory extends StatelessWidget {
  const DiaryHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'History',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 30, bottom: 30, right: 25, left: 25),
              child: Column(
                children: [
                  //TODO: display the list of sensory overload records
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 134, 177, 230),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 25, right: 55),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '05',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('March',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ]),
                          ),
                          Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Title',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(height: 16),
                                  Text('Next time I will create a list...',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ]),
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
                                      fontSize: 15,
                                    ),
                                  ),
                                ]),
                          ),
                        ]),
                  ),

                  //FIXME: Remove this code after implementing the list view

                  Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 178, 208, 245),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)), // Define border radius here
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
