import 'package:escape/custom_widgets/pie_chart_widget.dart';
import 'package:flutter/material.dart';

class OverloadOverview extends StatefulWidget {
  @override
  _OverloadOverview createState() => _OverloadOverview();
}

class _OverloadOverview extends State<OverloadOverview> {
  bool _showMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 81, 116, 1.0),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sensory Trends',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: 300,
                ),
                margin: EdgeInsets.only(bottom: 10, top: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF0F6C95),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    PieChartWidget(),
                    IconButton(
                      icon: Icon(
                        _showMore
                            ? Icons.keyboard_double_arrow_up
                            : Icons.keyboard_double_arrow_down,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _showMore = !_showMore;
                        });
                      },
                    ),
                    _showMore
                        ? Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'What does this mean?',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('What can I do to improve?',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      RichText(
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(
                                          text:
                                              'Our App has a very effective tool to plan your day and get reminder. by utilising this feature you can manage your activities and avoid the stimuli',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 1.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
