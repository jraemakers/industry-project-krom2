class SenosoryOverloadDiary {
  //TODO: add (uuid)String id;
  String title;
  String trigger;
  String date;
  int duration;
  String diaryNote;

  SenosoryOverloadDiary({
    required this.title,
    required this.trigger,
    required this.date,
    required this.duration,
    required this.diaryNote,
  });

  factory SenosoryOverloadDiary.fromJson(Map<String, dynamic> json) {
    return SenosoryOverloadDiary(
      title: json['title'],
      trigger: json['trigger'],
      date: json['date'],
      duration: json['duration'],
      diaryNote: json['diaryNote'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'trigger': trigger,
      'date': date,
      'duration': duration,
      'diaryNote': diaryNote,
    };
  }
}
