// To parse this JSON data, do
//
//     final newsList = newsListFromJson(jsonString);

import 'dart:convert';

List<NewsList> newsListFromJson(String str) =>
    List<NewsList>.from(json.decode(str).map((x) => NewsList.fromJson(x)));

String newsListToJson(List<NewsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsList {
  String id;
  String title;
  String content;
  String type;
  String cover;
  bool isPublished;
  dynamic schoolId;
  DateTime createdAt;
  DateTime updatedAt;
  School? school;

  NewsList({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.cover,
    required this.isPublished,
    required this.schoolId,
    required this.createdAt,
    required this.updatedAt,
    required this.school,
  });

  NewsList copyWith({
    String? id,
    String? title,
    String? content,
    String? type,
    String? cover,
    bool? isPublished,
    dynamic schoolId,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic school,
  }) =>
      NewsList(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        type: type ?? this.type,
        cover: cover ?? this.cover,
        isPublished: isPublished ?? this.isPublished,
        schoolId: schoolId ?? this.schoolId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        school: school ?? this.school,
      );

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        type: json["type"],
        cover: json["cover"],
        isPublished: json["isPublished"],
        schoolId: json["schoolId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        school: json["school"] != null ? School.fromJson(json["school"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "type": type,
        "cover": cover,
        "isPublished": isPublished,
        "schoolId": schoolId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "school": school?.toJson(),
      };
}

class School {
  String name;

  School({
    required this.name,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
