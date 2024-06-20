import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String time;
  final String date;
  final String note;
  final String location;
  final List<Map<String, dynamic>> checklist;
  final bool isCompleted;
  final VoidCallback onDelete;

  TaskCard({
    required this.title,
    required this.time,
    required this.date,
    required this.note,
    required this.location,
    required this.checklist,
    required this.isCompleted,
    required this.onDelete,
  });

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  late List<Map<String, dynamic>> checklist;

  @override
  void initState() {
    super.initState();
    checklist = widget.checklist;
  }

  void _updateChecklistItem(int index, bool? value) {
    setState(() {
      checklist[index]['completed'] = value!;
    });
  }

  bool _isTaskCompleted() {
    return checklist.isNotEmpty && checklist.every((item) => item['completed'] == true);
  }

  @override
  Widget build(BuildContext context) {
    bool isTaskCompleted = _isTaskCompleted();

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  backgroundColor: Color(0xFF00567F),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          widget.onDelete();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time: ${widget.time}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Date: ${widget.date}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Location: ${widget.location}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Note: ${widget.note}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Checklist:',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        ...checklist.map((item) {
                          return CheckboxListTile(
                            value: item['completed'],
                            onChanged: (bool? value) {
                              setState(() {
                                _updateChecklistItem(checklist.indexOf(item), value);
                              });
                            },
                            title: Text(
                              item['title'],
                              style: TextStyle(
                                color: Colors.white,
                                decoration: item['completed'] ? TextDecoration.lineThrough : TextDecoration.none,
                              ),
                            ),
                            activeColor: Color(0xFF00BFFF), // Change to light blue
                            checkColor: Colors.white,
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF0088A3),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      widget.time,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  isTaskCompleted ? Icons.check_circle : Icons.cancel,
                  color: isTaskCompleted ? Color(0xFF66BB6A) : Color(0xFFFF7043), // Green for completed, Red for incomplete
                ),
                // IconButton(
                //   icon: Icon(Icons.delete, color: Colors.white),
                //   onPressed: widget.onDelete,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
