class SenosoryOverloadDiary {
  //TODO: add (uuid)String id;
  String title;
  List<String> triggers;
  String date;
  int duration;
  String diaryNote;

  SenosoryOverloadDiary({
    required this.title,
    required this.triggers,
    required this.date,
    required this.duration,
    required this.diaryNote,
  });

  factory SenosoryOverloadDiary.fromJson(Map<String, dynamic> json) {
    return SenosoryOverloadDiary(
      title: json['title'],
      triggers: List<String>.from(json['triggers']),
      date: json['date'],
      duration: json['duration'],
      diaryNote: json['diaryNote'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'triggers': triggers,
      'date': date,
      'duration': duration,
      'diaryNote': diaryNote,
    };
  }
}
