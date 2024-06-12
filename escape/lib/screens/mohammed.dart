import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Mohammed extends StatelessWidget {
  const Mohammed({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> sureActivities = [];
  List<Map<String, dynamic>> unsureActivities = [
    {'title': 'Meeting With Jan', 'time': '10:00', 'checklist': ['Laptop', 'Camera', 'Umbrella'], 'checked': false},
    {'title': 'Groceries', 'time': '11:00', 'checklist': ['List', 'Bags'], 'checked': false},
    {'title': 'Running', 'time': '12:00', 'checklist': ['Shoes', 'Water Bottle'], 'checked': false},
    {'title': 'Night-Club', 'time': '20:00', 'checklist': ['ID', 'Money'], 'checked': false},
    {'title': 'Workout', 'time': '06:00', 'checklist': ['Gym Clothes', 'Towel'], 'checked': false},
    {'title': 'Dinner with Family', 'time': '19:00', 'checklist': ['Reservations', 'Gifts'], 'checked': false},
  ];
  List<Map<String, dynamic>> history = [];

  @override
  void initState() {
    super.initState();
    _loadSureActivities();
    _loadHistory();
    _scheduleNextActivityReminder();
  }

  _loadSureActivities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? sureActivityList = prefs.getStringList('sureActivities');
    if (sureActivityList != null) {
      setState(() {
        sureActivities = sureActivityList.map((activity) => Map<String, dynamic>.from(activity as Map)).toList();
      });
    }
  }

  _saveSureActivities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> sureActivityList = sureActivities.map((activity) => activity.toString()).toList();
    await prefs.setStringList('sureActivities', sureActivityList);
  }

  _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? historyList = prefs.getStringList('history');
    if (historyList != null) {
      setState(() {
        history = historyList.map((activity) => Map<String, dynamic>.from(activity as Map)).toList();
      });
    }
  }

  _saveHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyList = history.map((activity) => activity.toString()).toList();
    await prefs.setStringList('history', historyList);
  }

  _scheduleNextActivityReminder() {
    if (sureActivities.isNotEmpty) {
      var nextActivity = sureActivities.first;
      var now = DateTime.now();
      var activityTime = DateTime(now.year, now.month, now.day, int.parse(nextActivity['time'].split(':')[0]), int.parse(nextActivity['time'].split(':')[1]));

      if (activityTime.isAfter(now)) {
        var duration = activityTime.difference(now);
        Timer(duration, () {
          _showNotification(nextActivity);
        });
      }
    }
  }

  _showNotification(Map<String, dynamic> activity) {
    // Implement notification logic here
    print("Reminder: Upcoming activity - ${activity['title']} at ${activity['time']}");
  }

  _addNewPlan(Map<String, dynamic> newPlan) {
    setState(() {
      var planTime = DateTime.parse(newPlan['date'] + ' ' + newPlan['time']);
      if (planTime.isAfter(DateTime.now())) {
        if (newPlan['date'] == DateFormat('yMMMd').format(DateTime.now())) {
          sureActivities.add(newPlan);
        } else {
          unsureActivities.add(newPlan);
        }
        _saveSureActivities();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    sureActivities.sort((a, b) => a['time'].compareTo(b['time']));
    unsureActivities.sort((a, b) => a['time'].compareTo(b['time']));
    var todayDate = DateFormat('yMMMd').format(DateTime.now());

    return Scaffold(
      backgroundColor: Color(0xFF004D64),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D64),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.history, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HistoryScreen(history: history),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFF004D64),
                  ),
                  child: Center(
                    child: Lottie.asset(
                      'assets/images/animation.json', // Make sure you have a Lottie animation file in the assets folder
                      fit: BoxFit.cover,
                      repeat: true,
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Today\'s Plan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    todayDate,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  children: [
                    if (sureActivities.isNotEmpty) ...[
                      PlanItem(
                        title: sureActivities.first['title'],
                        time: sureActivities.first['time'],
                        checklist: sureActivities.first['checklist'],
                        checked: true,
                        onChanged: (bool? value) {
                          setState(() {
                            sureActivities.first['checked'] = value;
                            if (!value!) {
                              unsureActivities.add(sureActivities.first);
                              sureActivities.removeAt(0);
                            }
                            _saveSureActivities();
                          });
                        },
                        onDelete: () {
                          setState(() {
                            history.add({...sureActivities.first, 'done': false});
                            sureActivities.removeAt(0);
                            _saveSureActivities();
                            _saveHistory();
                          });
                        },
                        isUpcoming: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AllActivitiesScreen(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'See All',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.arrow_forward, color: Colors.orange),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    ...sureActivities.skip(1).map((activity) => PlanItem(
                          title: activity['title'],
                          time: activity['time'],
                          checklist: activity['checklist'],
                          checked: true,
                          onChanged: (bool? value) {
                            setState(() {
                              activity['checked'] = value;
                              if (!value!) {
                                unsureActivities.add(activity);
                                sureActivities.remove(activity);
                              }
                              _saveSureActivities();
                            });
                          },
                          onDelete: () {
                            setState(() {
                              history.add({...activity, 'done': false});
                              sureActivities.remove(activity);
                              _saveSureActivities();
                              _saveHistory();
                            });
                          },
                        )),
                    Divider(color: Colors.white),
                    ...unsureActivities.map((activity) => PlanItem(
                          title: activity['title'],
                          time: activity['time'],
                          checklist: activity['checklist'],
                          checked: activity['checked'],
                          onChanged: (bool? value) {
                            setState(() {
                              activity['checked'] = value;
                              if (value!) {
                                sureActivities.add(activity);
                                unsureActivities.remove(activity);
                              }
                              _saveSureActivities();
                            });
                          },
                          onDelete: () {
                            setState(() {
                              history.add({...activity, 'done': false});
                              unsureActivities.remove(activity);
                              _saveSureActivities();
                              _saveHistory();
                            });
                          },
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text('New Plan'),
                      onTap: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return NewPlanDialog(onSave: _addNewPlan);
                          },
                        );
                      },
                    ),
                    ListTile(
                      title: Text('New Trigger'),
                      onTap: () {
                        // Handle new trigger
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF004D64),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class PlanItem extends StatefulWidget {
  final String title;
  final String time;
  final List<String> checklist;
  final bool checked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;
  final bool isUpcoming;

  PlanItem({
    required this.title,
    required this.time,
    required this.checklist,
    required this.checked,
    required this.onChanged,
    required this.onDelete,
    this.isUpcoming = false,
  });

  @override
  _PlanItemState createState() => _PlanItemState();
}

class _PlanItemState extends State<PlanItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(widget.title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Time: ${widget.time}'),
                  SizedBox(height: 10),
                  Text('Checklist:'),
                  Column(
                    children: widget.checklist
                        .map((item) => Row(
                              children: [
                                Icon(
                                  item == 'List'
                                      ? Icons.list
                                      : item == 'Bags'
                                          ? Icons.shopping_bag
                                          : item == 'Shoes'
                                              ? Icons.sports_handball
                                              : item == 'Water Bottle'
                                                  ? Icons.local_drink
                                                  : item == 'ID'
                                                      ? Icons.perm_identity
                                                      : item == 'Money'
                                                          ? Icons.attach_money
                                                          : item == 'Gym Clothes'
                                                              ? Icons.fitness_center
                                                              : item == 'Towel'
                                                                  ? Icons.beach_access
                                                                  : item == 'Reservations'
                                                                      ? Icons.restaurant
                                                                      : item == 'Gifts'
                                                                          ? Icons.card_giftcard
                                                                          : Icons.check,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 5),
                                Text(item),
                              ],
                            ))
                        .toList(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color(0xFF003B4C),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.orange),
                    SizedBox(width: 5),
                    Text(
                      widget.time,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: widget.checked,
                      onChanged: widget.onChanged,
                      checkColor: Color(0xFF003B4C),
                      fillColor: MaterialStateProperty.all(Colors.white),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.orange),
                      onPressed: widget.onDelete,
                    ),
                  ],
                ),
              ],
            ),
            if (widget.isUpcoming) ...[
              SizedBox(height: 10),
              Text(
                'Checklist:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: widget.checklist
                    .map((item) => Row(
                          children: [
                            Icon(
                              item == 'List'
                                  ? Icons.list
                                  : item == 'Bags'
                                      ? Icons.shopping_bag
                                      : item == 'Shoes'
                                          ? Icons.sports_handball
                                          : item == 'Water Bottle'
                                              ? Icons.local_drink
                                              : item == 'ID'
                                                  ? Icons.perm_identity
                                                  : item == 'Money'
                                                      ? Icons.attach_money
                                                      : item == 'Gym Clothes'
                                                          ? Icons.fitness_center
                                                          : item == 'Towel'
                                                              ? Icons.beach_access
                                                              : item == 'Reservations'
                                                                  ? Icons.restaurant
                                                                  : item == 'Gifts'
                                                                      ? Icons.card_giftcard
                                                                      : Icons.check,
                              color: Colors.orange,
                            ),
                            SizedBox(width: 5),
                            Text(
                              item,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height + 50),
      radius: 150,
    ));
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AllActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004D64),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D64),
        title: Text(
          'All Activities',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            PlanItem(
              title: 'Meeting With Jan',
              time: '10:00',
              checklist: ['Laptop', 'Camera', 'Umbrella'],
              checked: false,
              onChanged: (bool? value) {},
              onDelete: () {},
            ),
            PlanItem(
              title: 'Groceries',
              time: '11:00',
              checklist: ['List', 'Bags'],
              checked: false,
              onChanged: (bool? value) {},
              onDelete: () {},
            ),
            PlanItem(
              title: 'Running',
              time: '12:00',
              checklist: ['Shoes', 'Water Bottle'],
              checked: false,
              onChanged: (bool? value) {},
              onDelete: () {},
            ),
            PlanItem(
              title: 'Night-Club',
              time: '20:00',
              checklist: ['ID', 'Money'],
              checked: false,
              onChanged: (bool? value) {},
              onDelete: () {},
            ),
            PlanItem(
              title: 'Workout',
              time: '06:00',
              checklist: ['Gym Clothes', 'Towel'],
              checked: false,
              onChanged: (bool? value) {},
              onDelete: () {},
            ),
            PlanItem(
              title: 'Dinner with Family',
              time: '19:00',
              checklist: ['Reservations', 'Gifts'],
              checked: false,
              onChanged: (bool? value) {},
              onDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> history;

  HistoryScreen({required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004D64),
      appBar: AppBar(
        backgroundColor: Color(0xFF004D64),
        title: Text(
          'Activity History',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            var activity = history[index];
            return ListTile(
              title: Text(
                activity['title'],
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Time: ${activity['time']} - ${activity['done'] ? 'Done' : 'Not Done'}',
                style: TextStyle(color: Colors.white70),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewPlanDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  NewPlanDialog({required this.onSave});

  @override
  _NewPlanDialogState createState() => _NewPlanDialogState();
}

class _NewPlanDialogState extends State<NewPlanDialog> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _date = DateFormat('yMMMd').format(DateTime.now());
  String _time = '';
  String _location = '';
  List<String> _checklist = [];

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now().format(context);
  }

  _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _date = DateFormat('yMMMd').format(picked);
      });
    }
  }

  _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _time = picked.format(context);
      });
    }
  }

  _addChecklistItem(String item) {
    setState(() {
      _checklist.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Plan'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Date'),
                      readOnly: true,
                      controller: TextEditingController(text: _date),
                      onTap: _pickDate,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: _pickDate,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Time'),
                      readOnly: true,
                      controller: TextEditingController(text: _time),
                      onTap: _pickTime,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: _pickTime,
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                onChanged: (value) {
                  setState(() {
                    _location = value;
                  });
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _addChecklistItem('New Item');
                  });
                },
                child: Text('Add Checklist'),
              ),
              Column(
                children: _checklist.map((item) => Text(item)).toList(),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave({
                'title': _title,
                'date': _date,
                'time': _time,
                'location': _location,
                'checklist': _checklist,
                'checked': false,
              });
              Navigator.of(context).pop();
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
