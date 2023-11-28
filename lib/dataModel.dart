class DbModel {
  final String name;
  final String level;

  DbModel({required this.name, required this.level});

  factory DbModel.fromJson(Map<String, dynamic> json) {
    return DbModel(
      name: json['name'],
      level: json['level'],
    );
  }
}
