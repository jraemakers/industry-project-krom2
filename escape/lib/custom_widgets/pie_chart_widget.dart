import 'dart:convert';
import 'package:escape/models/PieChartDataModel.dart';
import 'package:escape/models/SensoryOverloadDiary.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PieChartWidget extends StatefulWidget {
  @override
  _PieChartWidget createState() => _PieChartWidget();
}

class _PieChartWidget extends State<PieChartWidget> {
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
    final List<PieChartSectionData> liveChartData =
        populatePieChart(_sensoryOverloadList).map((model) {
      return PieChartSectionData(
        value: model.value,
        color: model.color,
        title: '${model.title}',
        radius: model.radius,
        titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
      );
    }).toList();
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total triggers: ${getTotalTriggersCount(_sensoryOverloadList)}',
              style: const TextStyle(color: Colors.white),
            ),
            Column(
              children: [
                Container(
                  height: 220,
                  width: 220,
                  margin: const EdgeInsets.all(10),
                  child: PieChart(
                    PieChartData(sections: liveChartData),
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...liveChartData
                            .map((chartData) => _buildColorDescription(
                                chartData.color, '${chartData.value}%'))
                            .toList(),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorDescription(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          color: color,
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

int getTotalTriggersCount(List<SenosoryOverloadDiary> diaries) {
  return diaries.fold(
      0, (totalCount, diary) => totalCount + diary.triggers.length);
}

Map<String, int> countAndSortTriggers(List<SenosoryOverloadDiary> diaries) {
  var triggerCount = diaries
      .expand((diary) => diary.triggers)
      .fold<Map<String, int>>({}, (count, trigger) {
    count[trigger] = (count[trigger] ?? 0) + 1;
    return count;
  });

  var sortedEntries = triggerCount.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  return Map.fromEntries(sortedEntries);
}

double getPercentileOfTriggers(int total, int individualCount) {
  double percentile = (individualCount / total) * 100;

  return double.parse(percentile.toStringAsFixed(0));
}

Map<String, double> countAndSortTriggersByPercentile(
    List<SenosoryOverloadDiary> diaries) {
  var triggerCount = countAndSortTriggers(diaries);

  int totalTriggers = getTotalTriggersCount(diaries);

  return triggerCount.map((trigger, count) =>
      MapEntry(trigger, getPercentileOfTriggers(totalTriggers, count)));
}

List<PieChartDataModel> populatePieChart(List<SenosoryOverloadDiary> diaries) {
  var triggerCount = countAndSortTriggers(diaries);
  int totalTriggers = getTotalTriggersCount(diaries);

  List<Color> colors = [
    Color.fromARGB(255, 5, 149, 154),
    Color.fromARGB(255, 13, 179, 184),
    Color.fromARGB(157, 98, 197, 200),
    Color.fromARGB(240, 115, 202, 205),
    Color.fromARGB(196, 98, 159, 161),
    Color.fromARGB(255, 19, 87, 91),
  ];
  int colorIndex = 0;

  return triggerCount.entries.map((entry) {
    double value = getPercentileOfTriggers(totalTriggers, entry.value);
    Color color = colors[colorIndex % colors.length];
    colorIndex++;

    return PieChartDataModel(
      value: value,
      color: color,
      title: entry.key,
      radius: 60.0,
    );
  }).toList();
}
